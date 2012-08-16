class Week < ActiveRecord::Base
has_many :orders
has_many :extras
accepts_nested_attributes_for :extras

def end_date
	start_date + 3.days
end
end
