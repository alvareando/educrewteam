class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
