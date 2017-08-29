class ChatroomsController < ApplicationController

  def create
     new_chatroom = Chatroom.new(chatroom_params)
    if new_chatroom.user = current_user
      new_chatroom.save
    else
      new_chatroom = Chatroom.new(chatroom_params, suggestion: true)
      new_chatroom.save
    end
    redirect_to root_path (new_chatroom)
  end
  end

  def update
  end

  def show

  end
end
