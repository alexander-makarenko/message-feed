class SessionsController < ApplicationController
  before_action { authorize :session }

  def new
  end
  
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, success: 'Authentication successful'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_not_authorized
      redirect_to root_path
    end
end