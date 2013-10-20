class AddTagNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag_name, :string
  end
end
