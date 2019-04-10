class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def index
  end

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There is something wrong with your information"
    end
  end
  def create_user
    user = User.create(username: params[:session][:username], password: params[:session][:password])
    if user.save
      flash[:success] = "You have successfully sign up for MeowChat"
      redirect_to login_path
    else
      flash.now[:error] = "There is something wrong with your information"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end


  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end
end
