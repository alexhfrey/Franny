class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = Customer.find(auth["uid"])
	session[:user_id] = user.id
    cookies.permanent.signed[:permanent_user_id] = user.id if user.remember
    redirect_to root_url, :notice => "Thanks for signing in!"
  end
  

  def destroy
    session[:user_id] = nil
	cookies.delete :permanent_user_id 
    redirect_to root_url, :notice=> "Signed out!"
  end

  def failure
    redirect_to signin_path, :alert => "Authentication failed, please try again."
  end

end
