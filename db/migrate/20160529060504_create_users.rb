class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :authentication_token, index: true
      t.string :password_digest
      t.datetime :activated
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
