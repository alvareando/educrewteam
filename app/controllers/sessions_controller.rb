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
    @session = Session.new(session_params)
    if current_user.tutor?
      @session.tutor = current_user
      @session.update(suggestion: false)
      @session.user = nil
      if @session.save
        new_chatroom = Chatroom.new()
        new_chatroom.session = @session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
      else
        render :new
      end
    else
      @session.tutor = nil
      @session.user = current_user
      @session.update(suggestion: true)
      if @session.save
        new_chatroom = Chatroom.new()
        new_chatroom.session = @session
        new_chatroom.save
        redirect_to chatroom_path(new_chatroom)
      else
        render :new
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
