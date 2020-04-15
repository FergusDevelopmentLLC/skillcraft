class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :content
      t.string :type
      t.integer :score
      t.string :letter_grade
      t.belongs_to :student
      t.belongs_to :interaction
      
      t.timestamps
    end
  end
end
