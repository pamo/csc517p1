class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :UserName
      t.boolean :admin
      t.string :password

      t.timestamps
    end
  end
end
