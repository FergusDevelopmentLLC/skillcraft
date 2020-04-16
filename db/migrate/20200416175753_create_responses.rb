class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.belongs_to :interaction, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true
      t.string :type
      t.string :content
      t.integer :score
      t.string :letter_grade

      t.timestamps
    end
  end
end
