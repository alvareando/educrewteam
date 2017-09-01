class AddDescriptionAndAbout < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :about, :text
    change_column :sessions, :description, :text
  end
end
