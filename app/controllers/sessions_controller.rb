class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:admin_id] = user.id if user.is_admin 
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:alert] = "Login failed..."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:admin_id)
    redirect_to movies_path, notice: "Logged Out!"
  end
  
end
