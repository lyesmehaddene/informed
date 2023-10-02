class AddPostsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :url
      t.timestamps null: false

      t.references :user, null: false, foreign_key: true
    end
  end
end
