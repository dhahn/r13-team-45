class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.references :user
      t.string :title
      t.timestamps
    end
  end
end
