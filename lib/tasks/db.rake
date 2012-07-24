namespace :db do
  desc 'Remove and install new database from scratch'
  task :install => :environment do
    ActiveRecord::Base.connection.tables.each do |x|
      ActiveRecord::Base.connection.drop_table x
    end

    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end