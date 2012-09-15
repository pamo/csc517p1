class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :search_item
      t.text :results

      t.timestamps
    end
  end
end
