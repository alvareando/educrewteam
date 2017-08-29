class ChatroomsController < ApplicationController

  def update
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end
end
