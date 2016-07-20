class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "Successfully created new user!"
    else
      render :new
    end
  end

  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
