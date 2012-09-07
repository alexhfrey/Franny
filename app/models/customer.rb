class Customer < OmniAuth::Identity::Models::ActiveRecord

has_many :orders
validates_uniqueness_of :email
validates_presence_of :address
validates_presence_of :name
validates_presence_of :phone
validates_presence_of :email

def balance
orders.map{|a| a.amount}.sum - orders.sum(:paid)
end

def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |customer|
      customer.provider = auth["provider"]
      customer.uid = auth["uid"]
      customer.name = auth["info"]["name"]
	  customer.email = auth["info"]["email"]
	  customer.address = auth["info"]["address"]
	  customer.phone = auth["info"]["phone"]
    end
  end


end
