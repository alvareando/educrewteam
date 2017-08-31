class Session < ApplicationRecord
  belongs_to :tutor, foreign_key: "tutor_id", class_name: "User", optional: true
  belongs_to :users, optional: true
end
