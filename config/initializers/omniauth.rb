Rails.application.config.middleware.use OmniAuth::Builder do
 provider :identity, :fields => [:name, :email, :phone, :address, :remember ], :model => Customer,
 :on_failed_registration => CustomersController.action(:new)
  end