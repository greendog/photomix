# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'bootstrap'
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_locale
  before_filter :authenticate_user!, :set_current_user
  before_filter :setup, :set_pagination_params

  private
              # This hack is needed to access the current user in models. See http://rails-bestpractices.com/posts/47-fetch-current-user-in-models
  def set_current_user
    User.current = current_user
  end

  def setup
    redirect_to new_account_path if User.all.size == 0
  end

  def check_public_access
    require_user if ENV['PRIVATE'] == 'true'
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def set_pagination_params
    @page = params[:page]
    @per_page  = params[:per_page]
  end

  def set_locale
    I18n.locale = session[:locale]

    if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = I18n.locale = params[:locale].to_sym
    end
  end

end
