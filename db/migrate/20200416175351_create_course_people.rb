class CreateCoursePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :course_people do |t|
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
