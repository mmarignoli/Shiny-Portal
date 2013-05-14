class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    redirect_to root_path
  end

  def destroy
  end
end
