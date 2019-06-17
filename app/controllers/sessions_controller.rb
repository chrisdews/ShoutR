class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:username])
    # byebug
    if !user || !user.authenticate(params[:password])
      flash[:errors] = ["Credentials aren't valid"]
      # redirect_to new_session_path
    else
      session[:user_id] = user.id
      # redirect_to new_user_path
      # not configured yet
    end

  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
