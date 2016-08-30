class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: "", index: true
      t.string :phone, index: true
      t.string :name
      t.string :name_pinyin

      t.string :authentication_token, index: true
      t.datetime :activated
      t.integer :role, default: 0

      t.timestamps null: false
    end

  end
end
