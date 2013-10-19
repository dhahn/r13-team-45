class CreateChoreListItems < ActiveRecord::Migration
  def change
    create_table :chore_list_items do |t|
      t.references :chore_list
      t.string :body
      t.integer :value, default: 0
    end
  end
end
