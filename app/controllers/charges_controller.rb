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

	  flash[:error] = "Votre commande a bien été enregistrer! Veuillez vérifier votre email"
	  UserMailer.order_email(@user).deliver_now
	  redirect_to cart_show_path

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to cart_show_path
	end	
end
