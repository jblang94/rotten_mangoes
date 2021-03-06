class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  def restrict_admin_access
    if (!current_user || !current_user.is_admin) && !masquerading?
      flash[:warning] = "You must be an administrator in order to access this page"
      redirect_to movies_path
    end
  end

  def restrict_access
    if !current_user
      flash[:warning] = "Login required"
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def masquerading?
    session[:admin_id].present?
  end

  helper_method :current_user
  helper_method :masquerading?
  
end
