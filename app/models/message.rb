class Message < ApplicationRecord
  belongs_to :sender
  belongs_to :chatroom

  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end
end
