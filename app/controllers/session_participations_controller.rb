class SessionParticipationsController < ApplicationController
  def create
    student_id = current_user.id
    session = Session.find(params[:session_id])
    redirect_to chatroom_path(session.chatroom)
  end
end
