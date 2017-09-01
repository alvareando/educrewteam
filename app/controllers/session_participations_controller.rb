class SessionParticipationsController < ApplicationController
  def create
    session = Session.find(params[:session_id])
    participation = SessionParticipation.new(session: session, student: current_user)
    if participation.save
      redirect_to chatroom_path(session.chatroom, notice: "Thanks for joining #{session.title}")
    else
      redirect_to session_path(session, alert: "Something went wrong!")
    end
  end
end
