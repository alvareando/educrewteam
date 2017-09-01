class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @sessions = current_user.sessions.where.not(tutor_id: current_user.id)
    raise
  end

  def tutor_dashboard

  end
end
# current_user.sessions.where(session.session_participations = current_user.session_participations.id)
