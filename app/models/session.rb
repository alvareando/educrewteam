class Session < ApplicationRecord
  belongs_to :tutor, foreign_key: "tutor_id", class_name: "User"

  monetize :price_cents

  has_one :chatroom, dependent: :destroy
  has_many :session_participations

  validates :subject, presence: true
end


