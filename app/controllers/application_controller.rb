class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def is_admin
	  if current_user
		if current_user.id != 4 && current_user.id != 1
			flash[:notice] = "You are not authorized to access this page."
			redirect_to current_user and return
		end
	  else 
		flash[:notice] = "You must be logged in to access this page."
		redirect_to 'sessions#new' and return
	  end
  end
  def is_admin_or_user
	user = Customer.find(params[:id])
	if current_user
		if current_user.id != user.id && current_user.id != 4 && current_user.id != 1
			redirect_to current_user and return
		end
	else
		redirect_to 'sessions#new' and return
	end					
  end
  def current_user
   return unless cookies[:permanent_user_id] || session[:user_id]
  begin
     @current_user ||= Customer.find(cookies.signed[:permanent_user_id] || session[:user_id])
  rescue
	nil
  end
  end
end
