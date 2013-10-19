class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :recipient_email
      t.string :token
      t.string :room_id
      t.string :sender

      t.timestamps
    end
  end
end
