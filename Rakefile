# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'Generate Entity Relationship Diagram'
task :generate_erd do
  File.delete('./db/development.sqlite3') if File.exist?('./db/development.sqlite3')
  File.delete('./db/schema.rb') if File.exist?('./db/schema.rb')
  system "rails db:migrate"
  system "EAGER_LOAD=1 bundle exec erd --inheritance --filetype=dot --direct --attributes=foreign_keys,content"
  system "dot -Tpng erd.dot > ./db/erd/generated/erd_#{DateTime.now.strftime('%Q')}.png"
  File.delete('erd.dot') if File.exist?('erd.dot') if File.exist?('erd.dot')
  File.delete('erd.pdf') if File.exist?('erd.pdf') if File.exist?('erd.pdf')
  system "rake db:seed"
  system "rails s"
end