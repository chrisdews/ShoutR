class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.date :date_of_birth
      t.string :email

      t.timestamps
    end
  end
end
