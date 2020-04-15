class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.belongs_to :classroom
      t.string :name
      t.timestamps
    end
  end
end
