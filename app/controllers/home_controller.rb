class HomeController < ApplicationController
  def index
    @cats = Item.all
  end

  def show
  	@cat = Item.find(params[:id])
  end
end
