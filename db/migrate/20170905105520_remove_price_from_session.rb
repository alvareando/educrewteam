class RemovePriceFromSession < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :price, :integer
  end
end
