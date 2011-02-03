class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
    session[:counter] ||= 0
    session[:counter] += 1
  end

end
