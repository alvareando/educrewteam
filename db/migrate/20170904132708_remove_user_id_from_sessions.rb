class RemoveUserIdFromSessions < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :user_id, :integer
    remove_column :sessions, :suggestion, :boolean
  end
end
