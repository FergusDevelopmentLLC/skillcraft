class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.string :type
      t.integer :topic_id
      t.integer :course_id
      t.string :title
      t.date :start_date
      t.date :end_date
      t.date :posted_date
      t.date :due_date
      t.boolean :graded
      t.integer :points
      t.string :instructions

      t.timestamps
    end
  end
end
