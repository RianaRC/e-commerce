class CartController < ApplicationController
  def create
  	if user_signed_in?
  		item = Item.find(params[:id])

  		@cart = Cart.find_by(user_id: current_user.id)
  		associations = AssociateItemCart.find_by(item_id: item.id)

  		if @cart != nil
  			if associations == nil
  				assoc = AssociateItemCart.new
		  		assoc.cart = @cart
		  		assoc.item = item

		  		assoc.save 

		  		flash[:success] = "Ajouté avec succès !"

  				redirect_to item_show_path(params[:id])
  			else
  				flash[:warning] = "Vous avez déjà commander cet image !"
  				redirect_to item_show_path(params[:id])
  			end
  		else
  			cart = Cart.new
	  		cart.user = current_user
	  		assoc = AssociateItemCart.new
	  		assoc.cart = cart
	  		assoc.item = item

	  		cart.save
	  		assoc.save

	  		flash[:success] = "Ajouté avec succès !"

	  		redirect_to item_show_path(params[:id])
  		end
  	else
  		flash[:error] = "Veuillez vous logger svp !"
  		redirect_to user_session_path
  	end
  end
end
