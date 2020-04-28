namespace :export do
    desc "Prints Country.all in a seeds.rb way."
    task :seeds_format => :environment do
      Classroom.order(:id).all.each do |classroom|
        puts "Classroom.create(#{classroom.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Course.order(:id).all.each do |course|
        puts "Course.create(#{course.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Interaction.order(:id).all.each do |interaction|
        puts "Interaction.create(#{interaction.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Person.order(:id).all.each do |person|
        puts "Person.create(#{person.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Post.order(:id).all.each do |post|
        puts "Post.create(#{post.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Question.order(:id).all.each do |question|
        puts "Question.create(#{question.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Quiz.order(:id).all.each do |quiz|
        puts "Quiz.create(#{quiz.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Response.order(:id).all.each do |response|
        puts "Response.create(#{response.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Student.order(:id).all.each do |student|
        puts "Student.create(#{student.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Test.order(:id).all.each do |test|
        puts "Test.create(#{test.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Topic.order(:id).all.each do |topic|
        puts "Topic.create(#{topic.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  end

  #$ rake export:seeds_format > db/seeds.rb