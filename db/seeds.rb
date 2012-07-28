#coding: utf-8
require_relative "../test/blueprints"
require 'fileutils'

@user_role = Role.make! name: 'user'

FileUtils.rm_rf "#{Rails.root}/public/uploads"
FileUtils.mkdir_p "#{Rails.root}/tmp/attachments"

user = User.make! email: 'test@example.com', password: 'password', password_confirmation: 'password',
                  first_name: 'Username', second_name: 'Secondname', surname: 'Surname', confirmed_at: Time.now,
                  confirmation_sent_at: (Time.now+3)

user.roles << Role.make!(name: 'admin')
user.save!

20.times.map { User.make! }
60.times.map { Collection.make! }
60.times.map { Album.make! }
60.times.map { Photo.make! }
30.times.map { CollectionAlbum.make! }

30.times.map{ Rate.make!(:collections) }
30.times.map{ Rate.make!(:albums) }
30.times.map{ Rate.make!(:photos) }

FileUtils.rm_rf "#{Rails.root}/tmp/attachments"
