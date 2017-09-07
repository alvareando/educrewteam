class SessionsController < ApplicationController
  def index
    if params[:subject].present? && params[:university].present?
      # @sessions = Session.where(subject: params[:subject], university: params[:university])
      @sessions = Session.where("subject ilike ? AND university ilike ?", params[:subject], params[:university])
    elsif params[:subject].present?
      @sessions = Session.where("subject ilike ?", params[:subject])
    elsif params[:university].present?
      @sessions = Session.where("university ilike ?", params[:university])
    else
      @sessions = Session.all
    end
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    authorize @session
    if current_user.tutor?
      @session.tutor = current_user
      if @session.save
        new_chatroom = Chatroom.new
        new_chatroom.session = @session
        new_chatroom.save
        redirect_to tutor_dashboard_path
      else
        render :new
      end
    else
      redirect_to root_home, alert: "You can't do this!"
    end
  end

  def show
    @session = Session.find(params[:id])
    @user = @session.tutor
    @chatroom = @session.chatroom
    @review = Review.new
  end

  def live
    @session = Session.find(params[:id])
    authorize @session
    @user = @session.tutor
    @chatroom = @session.chatroom

    require 'twilio-ruby'

    @tutor_id = @session.tutor.email
    @user_id = current_user.email
    identity = current_user.email

    @token = Twilio::JWT::AccessToken.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], identity: identity)
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    # grant.room = 'DailyStandup'
    @token.add_grant(grant)
  end

  def update
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:title, :description, :date, :time, :price, :subject, :university, :duration)
  end

end
