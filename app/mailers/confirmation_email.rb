class ConfirmationEmail < ActionMailer::Base
  default :from => "frannyskitchen@example.com"
  
  def order_confirmation(order)
	@order = order
	mail(:to => @order.email, :subject => "Your Franny's Kitchen Order")
  end
end
