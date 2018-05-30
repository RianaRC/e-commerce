class HomeController < ApplicationController
  def index
    @cats = Item.all
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
<<<<<<< HEAD
				current_user.cart = @cart
				@cart.save
||||||| merged common ancestors
    		@cart.user = current_user
=======
    		current_user.cart = @cart
    		@cart.save
>>>>>>> 6d6ad5708e7121d1a420a42c6eea49e84406d26b
    		@items = []
    	end
    end
  end

	def show
  	@cat = Item.find(params[:id])
  	if user_signed_in?
    	@cart = Cart.find_by(user_id: current_user.id)
  		associations = AssociateItemCart.where(cart_id: @cart.id)
  		@items = []
  		associations.each do |a|
  			@items.push(Item.find(a.item_id))
  		end
    end
  end

  def cart
  	if user_signed_in?
  		@cart = Cart.find_by(user_id: current_user.id)
  		associations = AssociateItemCart.where(cart_id: @cart.id)
  		@items = []
  		associations.each do |a|
  			@items.push(Item.find(a.item_id))
  		end
  		if @cart != nil
	  		associations = AssociateItemCart.where(cart_id: @cart.id)
	  		@items = []
	  		associations.each do |a|
	  			@items.push(Item.find(a.item_id))
	  		end
  			render "cart"
    	else
    		@cart = Cart.new
    		current_user.cart = @cart
    		@cart.save
    		@items = []
    		render "cart"
    	end
  	else
  		redirect_to(user_session_path)
  	end
  end
end
