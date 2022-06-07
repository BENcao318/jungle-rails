class SessionsController < ApplicationController
  def new; end
  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_first_name] = user.first_name
      puts session[:user_id]
      puts "id------------ #{user.first_name}"
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or pasword'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_first_name] = nil
    redirect_to root_path, notice: 'Logged Out'
  end
end