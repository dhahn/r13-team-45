class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.string :body
      t.integer :value, default: 0
      t.references :list
      t.timestamps
    end
  end
end
