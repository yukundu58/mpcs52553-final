class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to "/"
  end


  def create
    user = User.find_by(username: params["username"])
    if user != nil
      if user.authenticate(params['password'])
        session[:user_id] = user.id
        # cookies[:user_id] = user.id
        # cookies.signed[:user_id] = user.id
        flash[:success] = "Welcome back, #{user.first_name} #{user.last_name}"
        redirect_to "/libraries"
      else
        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end

end
