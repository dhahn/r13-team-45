class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.references :user
      t.string :title
    end
  end
end
