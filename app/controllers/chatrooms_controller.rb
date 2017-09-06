class ChatroomsController < ApplicationController

  def update
  end

  def show
    @chatroom = Chatroom.includes(messages: :sender).find(params[:id])
  end
end
