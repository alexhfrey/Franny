class ExtraOrder < ActiveRecord::Base
belongs_to :extra
belongs_to :order

def in_words
   if quantity.nil?
		""
   else
   quantity.to_s + " " + extra.name
	end
   end
end
