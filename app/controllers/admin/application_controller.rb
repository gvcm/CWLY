class Admin::ApplicationController < ApplicationController
  before_action :require_login, except: :login

  def index
  end

  def login
    redirect_to admin_dashboard_path if (request.post? and authenticate!) or current_user
  end

  private

  def require_login
    redirect_to admin_users_path unless current_user
  end

  def authenticate!
    session[:current_user] = admin_user_params[:username] if Admin::User.authenticate(admin_user_params[:username], admin_user_params[:password])
  end

  def current_user
    @current_user ||= Admin::User.find_by_username(session[:current_user]) if session[:current_user]
  end

  def admin_user_params
    params.require(:admin_user).permit(:username, :password)
  end
end
