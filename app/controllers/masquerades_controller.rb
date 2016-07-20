class MasqueradesController < ApplicationController
  
  before_filter :restrict_admin_access

  def new
    user = User.find(params[:user_id])
    sign_in(user)
    redirect_to movies_path, notice: "Now logged in as #{user.fullname}"
  end

  def destroy
    admin = User.find(session[:admin_id])
    sign_in(admin)
    redirect_to admin_users_path, notice: "Switched back to admin role"
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

end