source 'http://rubygems.org'

gem 'rails', '3.2.7'
gem 'sqlite3'
gem 'mime-types', :require => 'mime/types'
gem 'carrierwave'
gem 'dynamic_form'
gem 'kaminari', :git => 'git://github.com/amatsuda/kaminari.git'
gem 'princely'
gem 'unicorn'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'ajaxful_rating_jquery', :git => 'git://github.com/greendog/ajaxful_rating_jquery.git'#, :branch => 'rails3'
gem 'configatron', :git => 'git://github.com/markbates/configatron.git'
gem 'plupload-rails', :git => 'git://github.com/bryanmig/plupload-rails.git'
#gem 'sequel', :git => 'git://github.com/jeremyevans/sequel.git'
gem 'breadcrumbs_on_rails', :git => 'git://github.com/lloydk/breadcrumbs_on_rails.git'
gem 'russian', :git => 'git://github.com/yaroslav/russian.git'

gem "devise_omniauth_engine", :git=>"git://github.com/greendog/devise_omniauth_engine.git"
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-openid'
gem 'omniauth-google-apps'
gem 'omniauth-vkontakte', :git => 'git://github.com/mamantoha/omniauth-vkontakte.git'
gem 'cancan'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do
  gem 'ffaker'
  gem 'machinist'
  gem 'action_mailer_tls', :git => 'git://github.com/openrain/action_mailer_tls.git'
  gem 'capistrano', :git => 'git://github.com/capistrano/capistrano.git'
  gem 'capistrano-unicorn', :git => 'git://github.com/sosedoff/capistrano-unicorn.git'
  gem 'rvm-capistrano'
  gem 'capistrano_colors'
end

# -- Cloud storage
# AWS S3 support. Can be disabled if using local file system instead of cloud storage.
gem 'fog'

# -- Photo resizing
# MiniMagick
gem "mini_magick"

# ImageMagick:
#gem "rmagick", :require => 'RMagick'

# FreeImage:
#gem "RubyInline"
#gem "image_science", :git => 'git://github.com/perezd/image_science.git'

# -- EXIF
# Mini exif tool. Can be disabled. Remove exif_read and exif_write filters in photo model
gem "mini_exiftool"