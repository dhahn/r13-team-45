class AddRoomIdToBasicallyEverything < ActiveRecord::Migration
  def change
    add_column :check_lists, :room_id, :integer
    add_column :poll_lists, :room_id, :integer
    add_column :bills, :room_id, :integer
    add_column :chore_lists, :room_id, :integer
    add_column :check_list_items, :room_id, :integer
    add_column :chore_list_items, :room_id, :integer
    add_column :poll_list_items, :room_id, :integer
    add_column :chore_list_recurring_items, :room_id, :integer
    add_column :notes, :room_id, :integer
    add_column :pictures, :room_id, :integer
  end
end
