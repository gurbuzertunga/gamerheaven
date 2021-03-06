class SessionsController < ApplicationController
  def new; end

  def login
    @user = User.find_by(session_params)
    if @user
      login_user(@user.id)
      redirect_to root_path
    else
      flash.now[:login_error] = 'User not found'
      render 'new'
    end
  end

  def logout
    logout_user
    redirect_to login_path
  end

  private

  def session_params
    params.require('session').permit(:username)
  end
end
