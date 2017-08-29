class UsersController < ApplicationController
  def update
    if @user.update(user_params)
    else
      render 'edit'
    end
  end

  private
  def user_params
     params.require(:users).permit(:first_name, :last_name, :email, :password, :photocache)
  end
end
