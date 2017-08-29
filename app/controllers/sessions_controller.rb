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
    @session = Session.new()
  end

  def create
    new_session = Session.new(session_params)
    if current_user.tutor?
      new_session.tutor = current_user
      new_session.user = nil
      if new_session.save
        new_chatroom = Chatroom.new()
        new_chatroom.session = new_session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
      else
        @session = Session.new()
        redirect_to :back
      end
    else
      new_session.tutor = nil
      new_session.user = current_user
      new_session.update(suggestion: true)
      if new_session.save
        new_chatroom = Chatroom.new()
        new_chatroom.session = new_session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
      else
        @session = Session.new()
        redirect_to :back
      end
    end
  end

  def show
    @session = Session.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def session_params
    params.require(:session).permit(:title, :description, :date, :time, :price, :subject, :university, :suggestion)
  end

end
