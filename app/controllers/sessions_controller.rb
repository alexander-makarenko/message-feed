class SessionsController < ApplicationController
  before_action { authorize :session }

  def new
  end
  
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, success: 'Authentication successful'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

    def auth_hash
      request.env['omniauth.auth']
    end

  private

    def user_not_authorized
      redirect_to root_path
    end
end