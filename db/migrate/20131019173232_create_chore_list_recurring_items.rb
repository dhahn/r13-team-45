class CreateChoreListRecurringItems < ActiveRecord::Migration
  def change
    create_table :chore_list_recurring_items do |t|
      t.references :chore_list
      t.string :interval
      t.integer :specific_day_of
      t.string :body
      t.integer :value, default: 0
      t.timestamps
    end
  end
end
