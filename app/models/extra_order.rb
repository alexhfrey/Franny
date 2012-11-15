class ExtraOrder < ActiveRecord::Base
belongs_to :extra
belongs_to :order
validates :quantity, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :message => "must be a positive number, please enter 0 if you do not wish to order" }

def in_words
   if quantity == 0
		""
   else
   quantity.to_s + " " + extra.name + ","
	end
   end
end
