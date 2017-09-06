class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @ongoing_sessions = current_user.participating_sessions('ongoing')
    @over_sessions = current_user.participating_sessions('over')
  end

  def tutor_dashboard
    redirect_to root_path, alert: "You are not a tutor" unless current_user.tutor

    @ongoing_sessions = current_user.tutor_sessions('ongoing')
    @over_sessions = current_user.tutor_sessions('over')
  end

end
# current_user.sessions.where(session.session_participations = current_user.session_participations.id)
