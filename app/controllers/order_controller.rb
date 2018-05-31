class OrderController < ApplicationController
  def create
  	order = Order.new
  	order.user = current_user

  	assoc1 = AssociateOrderItem.new
  	assoc1.order = order

  	cart = Cart.find_by(user_id: current_user.id)
  	assoc2 = AssociateItemCart.where(cart_id: cart.id)

  	assoc2.each do |a|
  		item = Item.find(a.item_id)
  		assoc1.item = item
  		assoc1.save
  	end

  	order.save

  end
end
