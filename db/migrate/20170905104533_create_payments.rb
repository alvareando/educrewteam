class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :state
      t.string :session_uid
      t.monetize :amount
      t.jsonb :payment

      t.timestamps
    end
  end
end
