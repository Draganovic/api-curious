class SessionsController < ApplicationController
  def create
    @user = User.get_user(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
