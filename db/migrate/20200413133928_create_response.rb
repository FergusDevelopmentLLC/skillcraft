class CreateResponse < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
    t.string :content
    t.string :type
    t.integer :score
    t.string :letter_grade
    t.string :instructor
    t.integer :created_by_person_id
    t.integer :interaction_id
    t.timestamps
    end
  end
end
