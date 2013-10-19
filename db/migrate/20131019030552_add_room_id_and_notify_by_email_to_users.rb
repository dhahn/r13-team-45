class AddRoomIdAndNotifyByEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :notify_by_email, :boolean
    add_column :users, :room_id, :integer
  end
end
