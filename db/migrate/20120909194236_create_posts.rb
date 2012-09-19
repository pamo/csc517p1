class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :username
      t.text :content
      t.integer :votes, :default => 0
      t.references :category
      t.timestamps
    end
  end
end
