class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :lockable

  attr_accessible :id, :name, :second_name, :surname, :email, :password, :password_confirmation, :remember_me, :userpic

  ajaxful_rater

  mount_uploader :userpic, UserpicUploader

  has_and_belongs_to_many :roles

  def small_url
    userpic.url(:small)
  end

  alias_method :avatar, :small_url

  def thumb_url
    userpic.url(:thumb)
  end

  def original_url
    userpic.url(:original)
  end

  ##########################################################
  # This hack is needed to access the current user in models.
  #See http://rails-bestpractices.com/posts/47-fetch-current-user-in-models
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.admin_created?
    User.admin.count > 0
  end

  def has_role?(role_in_question)
    roles.any? { |role| role.name == role_in_question.to_s }
  end
end
