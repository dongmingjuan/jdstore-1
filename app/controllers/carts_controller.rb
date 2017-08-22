class CartsController < ApplicationController
  before_action :authenticate_user!
  def clear
    current_cart.clear!
    redirect_to :back
  end
  def checkout
    @order = Order.new 
  end
end
