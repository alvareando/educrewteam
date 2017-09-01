class AddStudentRefToParticipations < ActiveRecord::Migration[5.0]
  def change
    add_column :session_participations, :student_id, :integer
    add_index :session_participations, :student_id
  end
end
