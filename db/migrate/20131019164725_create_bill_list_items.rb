class CreateBillListItems < ActiveRecord::Migration
  def change
    create_table :bill_list_items do |t|
      t.references :bill_list
      t.string :body
      t.integer :value, default: 0
    end
  end
end
