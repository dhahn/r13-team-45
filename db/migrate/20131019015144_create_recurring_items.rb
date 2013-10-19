class CreateRecurringItems < ActiveRecord::Migration
  def change
    create_table :recurring_items do |t|
      t.string :type
      t.string :interval
      t.string :specific_day_of
      t.string :body
      t.integer :value
      t.timestamps
    end
  end
end
