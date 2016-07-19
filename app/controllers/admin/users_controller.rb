class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
