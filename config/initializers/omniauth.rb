Rails.application.config.middleware.use OmniAuth::Builder do
 provider :identity, :fields => [:name, :email, :phone, :address, :remember, :delivery_route ], :model => Customer,
 :on_failed_registration => CustomersController.action(:new)
 
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure }
 