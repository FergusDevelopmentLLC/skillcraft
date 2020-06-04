class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.string :image_url
      t.boolean :featured
      t.integer :tuition_cost
      t.string :short_desc
      t.string :long_desc
      t.timestamps
    end
  end
end
