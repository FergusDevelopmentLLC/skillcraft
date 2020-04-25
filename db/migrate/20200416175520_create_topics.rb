class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.belongs_to :classroom, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
