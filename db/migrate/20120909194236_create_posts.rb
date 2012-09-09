class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :username
      t.text :content
      t.string :category
      t.integer :votes

      t.timestamps
    end
  end
end
