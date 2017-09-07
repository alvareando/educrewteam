class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :chatroom

  validates :body, presence: true, allow_blank: false

  after_create :broadcast_message

  def from?(some_user)
    sender == some_user
  end

  private

  def broadcast_message
    ActionCable.server.broadcast("chatroom_#{chatroom.id}", {
      message_partial: ApplicationController.renderer.render(partial: "messages/message", locals: { message: self, user_is_messages_author: false}),
      # current_user_id: self.sender.id
      # c_user: self.sender.id
      sender: sender.id
    })
  end

end
