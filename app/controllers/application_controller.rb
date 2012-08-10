class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  def current_user
   return unless cookies[:permanent_user_id] || session[:user_id]
  begin
     @current_user ||= Customer.find(cookies.signed[:permanent_user_id] || session[:user_id])
  rescue
	nil
  end
  end
end
