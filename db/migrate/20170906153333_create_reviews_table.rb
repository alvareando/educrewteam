class CreateReviewsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, index: true
      t.references :session, foreign_key: true, index: true
      t.text :body
      t.timestamps
    end
  end
end
