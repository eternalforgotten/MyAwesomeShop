class CartsController < ApplicationController
  authorize_resource
  before_action :auth_user
  before_action :load_cart

  def show
    render json: @cart.to_json(include: {
                                  products: {}
                                })
  end

  def add
    product = Product.find(params[:id])
    @cart.products << product
    @cart.update(value: @cart.value + product.value)
    render json: @cart.to_json(include: {
                                products: {}
                              })
  end


  protected
  def load_cart
    @cart = current_user.cart
  end
  
end
