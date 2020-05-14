# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require_relative 'config/application'

Rails.application.load_tasks

desc 'Generate Entity Relationship Diagram'
task :gen do
  #system "killall -9 ruby"
  #system "killall -9 rails"
  
  File.delete('./db/development.sqlite3') if File.exist?('./db/development.sqlite3')
  File.delete('./db/schema.rb') if File.exist?('./db/schema.rb')
  system "rails db:migrate"
  system "EAGER_LOAD=1 bundle exec erd --inheritance --filetype=dot --direct --attributes=foreign_keys,content"
  system "dot -Tpng erd.dot > ./db/erd/generated/erd_#{DateTime.now.strftime('%Q')}.png"
  system "rake db:seed"
  system "rails s"
  #File.delete('erd.dot') if File.exist?('erd.dot')
  #File.delete('erd.pdf') if File.exist?('erd.pdf')
end

desc 'Make seeds'
task :make_seeds do
  
  #https://stackoverflow.com/questions/4393246/create-seed-file-from-data-already-in-the-database
  
  seedfile = File.open('db/seeds_new.rb', 'a')
  
  # c = Course.all
  # c.each do |course|
  #   seedfile.write "Course.create(#{course.attributes})\n"
  # end

  a = Announcement.all
  a.each do |announcement|
    seedfile.write "Announcement.create(#{announcement.attributes})\n"
  end

  as = Assignment.all
  as.each do |assignment|
    seedfile.write "Assignment.create(#{assignment.attributes})\n"
  end

  seedfile.close

  #https://stackoverflow.com/questions/27431532/why-am-i-getting-uninitialized-constant-for-a-rake-task-rails-4-1-8

  #bundle exec rake environment make_seeds
end
