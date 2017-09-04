class AddPriceToSessions < ActiveRecord::Migration[5.0]
  def change

    add_monetize :sessions, :price, currency: { present: false }
  end
end
