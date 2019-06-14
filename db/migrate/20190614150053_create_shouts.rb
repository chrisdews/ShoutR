class CreateShouts < ActiveRecord::Migration[5.2]
  def change
    create_table :shouts do |t|
      t.string :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
