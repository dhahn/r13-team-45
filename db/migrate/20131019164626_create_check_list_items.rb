class CreateCheckListItems < ActiveRecord::Migration
  def change
    create_table :check_list_items do |t|
      t.references :check_list
      t.string :body
      t.integer :value, default: 0
      t.timestamps
    end
  end
end
