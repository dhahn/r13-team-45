class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :note_type
      t.integer :note_type_id
      t.text :body
      t.timestamps
    end
  end
end
