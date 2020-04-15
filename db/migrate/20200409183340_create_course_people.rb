class CreateCoursePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :course_people do |t|
      t.references :course
      t.references :person
      t.timestamps
    end
  end
end
