class Session < ApplicationRecord
  belongs_to :tutor, foreign_key: "tutor_id", class_name: "User"

  monetize :price_cents

  has_one :chatroom, dependent: :destroy
  has_many :session_participations
  has_many :reviews, dependent: :destroy

  validates :subject, presence: true

  CATEGORIES = ["Finance", "Economics"]


  def get_color(subject)
    case subject
    when "Finance"
      return "#000428, #004e92"
    when "Economics"
      return "TODO"
    end
  end
end
