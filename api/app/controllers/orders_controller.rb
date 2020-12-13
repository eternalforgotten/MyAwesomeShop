class OrdersController < ApplicationController
  authorize_resource
  before_action :auth_user, :load_cart

  def index
    orders = current_user.orders
    if orders.empty?
      render json: {}, status: 204
    else
      render json: orders
    end
  end

  def show
    @order = Order.find(params[:id])
    render json: @order.to_json(include: {
                                  products: {}
                                })
  end
  
  def create
    unless current_user.cart.products.empty?
      @order = Order.new(
        value: current_user.cart.value,
        name: rand(0000000..9999999).to_s.rjust(7,"0"),
        user_id: current_user.id
      )
      @order.products << current_user.cart.products
      @cart.products.delete_all
      @cart.value = 0
      @order.save
      @cart.save
      render json: @order.to_json(include: {
                                    products: {}
                                  })
    else
      render json:{"cart": "empty"}, status: 400
    end
  end
  
  private
  
  def load_cart
  @cart = current_user.cart
  end
end
