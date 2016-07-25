class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id, index: true
      t.integer :blog_id, index: true

      t.timestamps null: false
    end
  end
end
