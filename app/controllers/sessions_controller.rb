class SessionsController < ApplicationController
  def new
    if current_user
      flash[:notice] = "You are already logged in"
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      cookies.signed[:user_id] = user.id
      flash[:notice] = "Signed in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Failed to sign in: invalid email/password combination"
      render :new
    end
  end

  def destroy
    cookies.delete :user_id
    flash[:notice] = "Signed out successfully"
    redirect_to root_path
  end
end
