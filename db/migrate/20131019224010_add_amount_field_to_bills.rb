class AddAmountFieldToBills < ActiveRecord::Migration
  def change
    add_column :bills, :amount, :float
  end
end
