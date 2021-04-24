class UsersController < ApplicationController
  def new
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed up successfully"
      redirect_to root_path
    else
      flash[:alert] = "Sign up failed"
      render :new
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end