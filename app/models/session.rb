class Session < ApplicationRecord
  belongs_to :tutor, foreign_key: "tutor_id", class_name: "User"

  monetize :price_cents

  has_one :chatroom, dependent: :destroy
  has_many :session_participations

  validates :subject, presence: true

  CATEGORIES = ["Finance", "Economics", "Mathematics", "Computer Science", "Medicine", "Politics"]


  def get_color(subject)
    case subject
    when "Finance"
      return "#000428, #004e92"
    when "Mathematics"
      return "#DBE6F6, #C5796D"
    when "Economics"
      return "#ff9966, #ff5e62"
    when "Computer Science"
      return "#000000, #434343"
    when "Medicine"
      return "#f85032, #e73827"
    when "Politics"
      return "#2196f3, #f44336"
    else
      return "#BD7356, #E0C2BA"
    end
  end
end
