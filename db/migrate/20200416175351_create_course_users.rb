class CreateCourseUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :course_users do |t|
      t.references :user
      t.references :course
      t.string :user_feedback
      t.timestamps
    end
  end
end
