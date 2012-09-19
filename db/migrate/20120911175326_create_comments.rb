class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.text :body
      t.integer :votes, :default => 0
      t.references :post

      t.timestamps
    end
  end
end
