class CreatePollLists < ActiveRecord::Migration
  def change
    create_table :poll_lists do |t|
      t.references :user
      t.string :question
      t.timestamps
    end
  end
end
