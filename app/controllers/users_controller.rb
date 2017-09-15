class UsersController < ApplicationController

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def become_tutor
    @user = current_user
    if @user.tutor
      redirect_to root_path
    end
  end

  def update_to_tutor

    @user = current_user

    if @user.update(user_params.merge(tutor: true))
      UserMailer.become_tutor_confirmation(@user).deliver_now
      flash[:notice] = "Only one last step to become a tutor! Check your email"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :about, :last_name, :email, :password, :photo)
  end
end
