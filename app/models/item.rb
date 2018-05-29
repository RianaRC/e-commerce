class Item < ApplicationRecord
	has_many :associate_item_cart
	has_many :cart, through: :order
end
