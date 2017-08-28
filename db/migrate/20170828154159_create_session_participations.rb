class CreateSessionParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :session_participations do |t|
      t.references :students, foreign_key: { to_table: :users }
      t.references :sessions, foreign_key: true

      t.timestamps
    end
  end
end
