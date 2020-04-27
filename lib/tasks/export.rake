namespace :export do
    desc "Prints Country.all in a seeds.rb way."
    task :seeds_format => :environment do
      Course.order(:id).all.each do |course|
        puts "Course.create(#{course.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Interaction.order(:id).all.each do |interaction|
        puts "Interaction.create(#{interaction.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Person.order(:id).all.each do |person|
        puts "Person.create(#{person.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
      Response.order(:id).all.each do |response|
        puts "Response.create(#{response.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
      end
    end
  end

  #$ rake export:seeds_format > db/seeds.rb