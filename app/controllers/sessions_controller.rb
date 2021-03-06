class SessionsController < ApplicationController

  def new 
  end

  def create
   user = User.find_by_email(params[:session][:email])
   if user && user.authenticate(params[:session][:password])
     sign_in user
     flash[:success] = "Welcome #{user.name}"
     redirect_to root_path
   else
     flash.now[:error] = 'Invalid email or password. Please try again.'
     render 'new'
   end
  end

  def destroy
    sign_out
    flash[:success] = "You have successfully signed out."
    redirect_to root_path
  end

end
