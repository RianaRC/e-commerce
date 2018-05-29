class Cart < ApplicationRecord
  has_many :associate_item_cart
  has_many :item, through: :associate_item_carts
end
