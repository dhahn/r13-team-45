class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.boolean :recurring
      t.string :interval
      t.integer :specific_day_of
      t.string :body
      t.integer :value, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
