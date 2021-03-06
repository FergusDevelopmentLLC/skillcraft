class CreateInteractions < ActiveRecord::Migration[6.0]
  def change
    create_table :interactions do |t|
      
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :type
      t.string :title
      t.date :due_date
      t.boolean :graded
      t.integer :points
      t.string :instructions

      t.timestamps
    end
  end
end
