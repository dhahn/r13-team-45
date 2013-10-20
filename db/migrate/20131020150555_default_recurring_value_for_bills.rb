class DefaultRecurringValueForBills < ActiveRecord::Migration
  def change
    change_column :bills, :recurring, :boolean, default: false
  end
end
