class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      t.string :type
           
      t.belongs_to :classroom
      t.belongs_to :topic
      t.belongs_to :course
      t.belongs_to :teacher
      
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
