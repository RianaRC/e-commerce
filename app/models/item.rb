class Item < ApplicationRecord
	has_many :order
	has_many :cart, through: :order
end
