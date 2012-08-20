class Week < ActiveRecord::Base
has_many :orders
has_many :extras
accepts_nested_attributes_for :extras, :reject_if => lambda { |a| a[:name].blank? }

def end_date
	start_date + 3.days
end
end
