class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :week
  validates_uniqueness_of :customer_id, :scope => :week_id, :message => "has already placed an order for this week"
  has_many :extra_orders
  accepts_nested_attributes_for :extra_orders
  
  def self.to_csv(orders)
	CSV.generate do |csv|
		csv << ["Name", "Address", "Route #", "Mon", "Tue", 
				"Wed", "Thur", "Extras", "Instructions", "Price" ]
		orders. each do |order|
			csv << [order.name, order.address.gsub(/\n/, " "), order.route, order.monday_orders, 
			order.tuesday_orders, order.wednesday_orders, order.thursday_orders,  order.extras_in_words , order.instructions, order.amount]
		end
		csv << ["TOTALS",,, orders.map{|a| a . monday_orders}.sum,  orders.map{|a| a . tuesday_orders}.sum, 
			orders.map{|a| a . wednesday_orders}.sum, orders.map{|a| a . thursday_orders}.sum, ,, orders.map{|a| a . amount}.sum]
	end
  end
  
  def extras(num)
	e = extra_orders.find_by_extra_id(num)
	if e.blank?
		0
	else
		e.quantity
	end
  end
  
  def extras_in_words
     extra_orders . collect { |eo| eo. in_words } .join(", ")
	 
  end
  
  def route
	customer_id.present? ? customer.delivery_route : ""
  end
  
  def amount
	sub_total + delivery_charge + extras_charge
  end
  
  def email
	customer_id.present? ? customer.email : read_attribute(:email)
  end
  
  def sub_total
   
	monday_orders * week.monday_price + tuesday_orders * week.tuesday_price + wednesday_orders * week.wednesday_price + thursday_orders * week.thursday_price 
  end
  
  def extras_charge
	extra_orders.map{|a| a.extra.price * a.quantity}.sum
  end
  
  def delivery_charge
	
	days_ordered = (monday_orders > 0 ? 1 : 0) + (tuesday_orders > 0 ? 1 : 0) + (wednesday_orders > 0 ? 1 : 0) + (thursday_orders > 0 ? 1 : 0)
	days_ordered * week.delivery_fee
  end
  
  def name
	customer_id.present? ? customer.name : read_attribute(:name)
  end
	
  def first_name
      name.split(" ").first
  end  
  
  
		
  def address
	customer_id.present? ? customer.address : read_attribute(:address)
  end
end
