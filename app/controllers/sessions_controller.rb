class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'U loged in bitch'
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Error motherfucker! U cant log in, nigga!"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'See ya, cunt'
    redirect_to root_path
  end
end