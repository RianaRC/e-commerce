class Item < ApplicationRecord
	has_many :associate_item_carts
	has_many :cart, through: :associate_item_carts

	has_many :associate_order_items
	has_many :order, through: :associate_order_items
end
