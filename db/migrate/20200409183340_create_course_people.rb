class CreateCoursePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :course_people do |t|
      t.integer :course_id
      t.integer :person_id
      t.timestamps
    end
  end
end
