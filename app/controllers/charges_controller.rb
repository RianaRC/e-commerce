class ChargesController < ApplicationController
	def new
		if user_signed_in?
    	@cart = Cart.find_by(user_id: current_user.id)
    	if @cart != nil
	  		associations = AssociateItemCart.where(cart_id: @cart.id)
	  		@items = []
	  		associations.each do |a|
	  			@items.push(Item.find(a.item_id))
	  		end
    	else
    		@cart = Cart.new
    		current_user.cart = @cart
    		@cart.save
    		@items = []
    	end
    end
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

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

  	assoc2.each do |a|
  		a.destroy
  	end

  	cart.destroy

	  flash[:success] = "Votre commande a bien été enregistrer! Veuillez vérifier votre email"
	  UserMailer.order_email(current_user).deliver_now
	  redirect_to cart_show_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to cart_show_path
	end	
end
