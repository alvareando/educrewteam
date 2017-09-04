class Chatroom < ApplicationRecord
  belongs_to :session
  has_many :messages, dependent: :destroy
end
