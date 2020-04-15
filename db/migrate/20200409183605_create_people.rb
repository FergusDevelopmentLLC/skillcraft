class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :user_name
      t.string :type
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email
      
      t.timestamps
    end
  end
end
