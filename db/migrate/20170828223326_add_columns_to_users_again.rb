class AddColumnsToUsersAgain < ActiveRecord::Migration[5.0]
  def change
   add_reference :sessions, :user, foreign_key: true
  end
end