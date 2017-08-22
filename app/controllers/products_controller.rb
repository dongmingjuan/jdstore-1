class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    end

    redirect_to :back
  end
  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image)
  end
end
