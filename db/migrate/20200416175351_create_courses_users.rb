class CreateCoursesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :courses_users do |t|
      t.references :course
      t.references :user
      t.timestamps
    end
  end
end
