class RemoveUserFromSessions < ActiveRecord::Migration[5.0]
  def chang

    remove_reference :sessions, :user, index: true
  end
end
