class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.firstname}!"
      redirect_to movies_path
    else
      flash.now[:danger] = "Login failed..."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:admin_id)
    flash[:success] = "Logged Out!"
    redirect_to movies_path
  end
  
end
