class CreateBillListRecurringItems < ActiveRecord::Migration
  def change
    create_table :bill_list_recurring_items do |t|
      t.references :bill_list
      t.string :interval
      t.integer :specific_day_of
      t.string :body
      t.integer :value, default: 0
    end
  end
end
