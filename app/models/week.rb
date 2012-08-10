class Week < ActiveRecord::Base
has_many :orders

def end_date
	start_date + 3.days
end
end
