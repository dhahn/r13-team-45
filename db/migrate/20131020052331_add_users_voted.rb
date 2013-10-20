class AddUsersVoted < ActiveRecord::Migration
  def change
    add_column :poll_list_items, :users_voted, :integer_array, array: true
  end
end
