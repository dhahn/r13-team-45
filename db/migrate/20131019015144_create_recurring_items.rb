class CreateRecurringItems < ActiveRecord::Migration
  def change
    create_table :recurring_items do |t|
      t.string :type
      t.string :interval
      t.integer :specific_day_of
      t.string :body
      t.integer :value, default: 0
      t.references :list
      t.timestamps
    end
  end
end
