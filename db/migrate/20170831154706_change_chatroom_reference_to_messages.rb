class ChangeChatroomReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :chatrooms_id, :chatroom_id
  end
end
