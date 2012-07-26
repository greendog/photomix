#coding: utf-8
require 'machinist/active_record'
require 'open-uri'

def random_str
  (0...8).map { 65.+(rand(25)).chr }.join
end

Role.blueprint {
  name { 'user' }
}

User.blueprint {
  rand(2) == 0 ? sex = :female : sex = :male
  email { "#{random_str}@example.com" }
  password { 'password' }
  password_confirmation { 'password' }
  first_name { Faker::NameRU.first_name(sex) }
  second_name { Faker::NameRU.patronymic(sex) }
  surname { Faker::NameRU.last_name(sex) }
  confirmed_at { Time.now + rand(1..4) }
  confirmation_sent_at { Time.now + rand(5..9) }
  userpic {
    file_name = ::SecureRandom.hex(8)
    file = open("http://lorempixel.com/800/500/abstract/")
    if file.kind_of? Tempfile
      name = File.basename(file.path)
      FileUtils.move(file.path, "#{Rails.root}/tmp/attachments/#{name}.jpeg")
      file = File.open("#{Rails.root}/tmp/attachments/#{name}.jpeg")
    end

    file.original_filename = "#{file_name}.jpeg" if file.kind_of? StringIO
    file
  }
}

Album.blueprint {
  title { Faker::Lorem.sentence(rand(3)) }
  description { Faker::Lorem.sentence }
  path { "my_album_#{sn}" }
  rating_average { rand(1..5) }
  public { true }
}

Collection.blueprint {
  title { Faker::Lorem.sentence(rand(3)) }
  description { Faker::Lorem.sentence }
  rating_average { rand(1..5) }
  public { true }
}

CollectionAlbum.blueprint {
  album { Album.find(rand(1..20)) }
  collection { Collection.find(rand(1..20)) }
}

Photo.blueprint {
  title { Faker::Lorem.sentence(rand(3)) }
  description { Faker::Lorem.sentence }
  album { Album.find(rand(1..20)) }
  rating_average { rand(1..5) }
  public { true }
  attachment {
    file_name = ::SecureRandom.hex(8)
    file = open("http://lorempixel.com/1300/1000/people/")
    if file.kind_of? Tempfile
      name = File.basename(file.path)
      FileUtils.move(file.path, "#{Rails.root}/tmp/attachments/#{name}.jpeg")
      file = File.open("#{Rails.root}/tmp/attachments/#{name}.jpeg")
    end

    file.original_filename = "#{file_name}.jpeg" if file.kind_of? StringIO
    file
  }
}

Rate.blueprint(:collections) {
  rateable { Collection.find(rand(1..20)) }
  rater { User.find(rand(1..20)) }
  stars { rand(1..5) }
}

Rate.blueprint(:albums) {
  rateable { Album.find(rand(1..20)) }
  rater { User.find(rand(1..20)) }
  stars { rand(1..5) }
}

Rate.blueprint(:photos) {
  rateable { Photo.find(rand(1..20)) }
  rater { User.find(rand(1..20)) }
  stars { rand(1..5) }
}


