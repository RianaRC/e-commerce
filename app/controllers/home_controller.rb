class HomeController < ApplicationController
  def index
    @cats = Item.all
    if user_signed_in?
    	@cart = Cart.find_by(user_id: current_user.id)
  		associations = AssociateItemCart.where(cart_id: @cart.id)
  		@items = []
  		associations.each do |a|
  			@items.push(Item.find(a.item_id))
  		end
    end
  end

	def show
		UserMailer.welcome_mail(current_user).deliver_now
		
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
  		render "cart"
  	else
  		redirect_to(user_session_path)
  	end
  end
end
