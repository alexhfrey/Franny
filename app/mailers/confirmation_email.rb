class ConfirmationEmail < ActionMailer::Base
  default :from => "franny@frannyskitchensf.com"
  
  def order_confirmation(order)
	@order = order
	mail(:to => [@order.email, 'frannyskitchen@yahoo.com'], :subject => "Your Franny's Kitchen Order")
  end
end
