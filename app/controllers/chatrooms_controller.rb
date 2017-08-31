class ChatroomsController < ApplicationController

  def update
  end

  def show
    @chatroom = ChatRoom.includes(messages: :user).find(params[:id])
  end
end
