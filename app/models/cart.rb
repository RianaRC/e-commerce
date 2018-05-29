class Cart < ApplicationRecord
  belongs_to :user
  has_many :associate_item_cart
  has_many :item, through: :order
end
