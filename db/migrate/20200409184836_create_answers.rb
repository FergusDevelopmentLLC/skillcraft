class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :created_by_person_id
      t.string :content

      t.timestamps
    end
  end
end
