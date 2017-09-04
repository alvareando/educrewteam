class SessionsController < ApplicationController
  def index
    if params[:subject].present? && params[:university].present?
      @sessions = Session.where(subject: params[:subject], university: params[:university])
      # @sessions = Session.where("subject = ? AND university = ?", params[:subject], params[:university])
    elsif params[:subject].present?
      @sessions = Session.where(subject: params[:subject])
    elsif params[:university].present?
      @sessions = Session.where(university: params[:university])
    else
      @sessions = Session.all
    end
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if current_user.tutor?
      @session.tutor = current_user
      if @session.save
        new_chatroom = Chatroom.new
        new_chatroom.session = @session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
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
  end

  def live
    @session = Session.find(params[:id])
    @user = @session.tutor
    @chatroom = @session.chatroom
  end

  def update
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:title, :description, :date, :time, :price, :subject, :university)
  end

end
