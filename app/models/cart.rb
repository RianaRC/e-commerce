class Cart < ApplicationRecord
  belongs_to :user
  has_many :order
  has_many :item, through: :order
end
