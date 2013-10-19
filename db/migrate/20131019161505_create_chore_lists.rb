class CreateChoreLists < ActiveRecord::Migration
  def change
    create_table :chore_lists do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
