class CreatePollListItems < ActiveRecord::Migration
  def change
    create_table :poll_list_items do |t|
      t.references :poll_list
      t.string :body
      t.integer :value, default: 0
      t.timestamps
    end
  end
end
