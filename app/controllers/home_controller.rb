class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]

  add_breadcrumb t('home_page'), :root_path

  def index
    @collections = Collection.popular.limit(12)
    @popular_photos = Photo.popular.limit(10)

    respond_to do |format|
      format.html
      format.json  { render :json => @collections }
      format.xml  { render :xml => @collections }
    end
  end
end
