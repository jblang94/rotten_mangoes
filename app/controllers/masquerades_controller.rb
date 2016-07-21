class MasqueradesController < ApplicationController
  
  before_filter :restrict_admin_access

  def new
    user = User.find(params[:user_id])
    sign_in(user)
    flash[:success] = "Now logged in as #{user.fullname}"
    redirect_to movies_path
  end

  def destroy
    admin = User.find(session[:admin_id])
    sign_in(admin)
    flash[:success] = "Switched back to admin role"
    redirect_to admin_users_path
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end