class Session < ApplicationRecord
  belongs_to :tutor, foreign_key: "tutor_id", class_name: "User", optional: true
  belongs_to :user, optional: true

  has_one :chatroom

  validates :subject, presence: true
end
