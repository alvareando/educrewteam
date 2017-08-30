class UsersController < ApplicationController

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end
end
