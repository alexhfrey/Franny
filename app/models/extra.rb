class Extra < ActiveRecord::Base
has_many :extra_orders
belongs_to :week
end
