class ChatroomsController < ApplicationController

  def update
  end

  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
  end
end
