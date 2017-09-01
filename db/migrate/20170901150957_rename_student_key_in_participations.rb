class RenameStudentKeyInParticipations < ActiveRecord::Migration[5.0]
  def change
    remove_column :session_participations, :students_id, :integer
  end
end
