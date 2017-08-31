class RenameSessionsIdInParticipations < ActiveRecord::Migration[5.0]
  def change
    remove_reference :session_participations, :sessions
    add_reference :session_participations, :session, foreign_key: true
  end
end
