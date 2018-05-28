class HomeController < ApplicationController
  def index
    @cat = Item.find(1)
  end
end
