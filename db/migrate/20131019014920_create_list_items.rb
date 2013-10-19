class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :list_id
      t.integer :recurring_item_id
      t.integer :item_id
      t.timestamps
    end
  end
end
