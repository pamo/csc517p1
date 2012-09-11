class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.integer :postid
      t.text :body
      t.integer :votes

      t.timestamps
    end
  end
end
