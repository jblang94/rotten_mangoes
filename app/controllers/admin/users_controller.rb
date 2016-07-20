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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path, notice: "Successfully editied #{@user.fullname}!"
    else
      render :edit
    end
  end

  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
