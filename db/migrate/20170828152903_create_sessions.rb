class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :tutor, foreign_key: { to_table: :users }
      t.date :date
      t.time :time
      t.integer :estimated_duration
      t.string :subject
      t.string :university
      t.string :title
      t.string :description
      t.integer :price
      t.boolean :suggestion, default: false

      t.timestamps
    end
  end
end
