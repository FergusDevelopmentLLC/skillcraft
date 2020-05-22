class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :course
      t.string :comment
      t.timestamps
    end
  end
end
