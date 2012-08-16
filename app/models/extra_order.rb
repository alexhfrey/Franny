class ExtraOrder < ActiveRecord::Base
belongs_to :extra
belongs_to :order

def in_words
   quantity.to_s + " " + extra.name
end
end
