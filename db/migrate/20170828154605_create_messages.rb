class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :sender, foreign_key: { to_table: :users }
      t.references :chatrooms, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
