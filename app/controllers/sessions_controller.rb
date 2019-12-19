class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete[:last_page] || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please.'
      render :new
    end
  end

  def destroy
    reset_session
    @user = User.new
    redirect_to login_path
  end
end
