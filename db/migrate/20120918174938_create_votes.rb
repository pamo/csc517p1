class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :uid
      t.integer :pid
      t.integer :cid

      t.timestamps
    end
  end
end
