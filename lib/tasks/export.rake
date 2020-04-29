namespace :export do
  desc "Prints objects in a seeds.rb way."
    task :seeds_format => :environment do
      
      Course.order(:id).all.each do |course|
        puts "Course.create(#{course.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end

      Teacher.order(:id).all.each do |teacher|
        puts "teacher.create(#{teacher.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      
      Student.order(:id).all.each do |student|
        puts "Student.create(#{student.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      
      Announcement.order(:id).all.each do |announcement|
        puts "Announcement.create(#{announcement.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      
      Assignment.order(:id).all.each do |assignment|
        puts "Assignment.create(#{assignment.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      
      Response.order(:id).all.each do |response|
        puts "Response.create(#{response.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      
  end
end

  #$ rake export:seeds_format > db/seeds.rb