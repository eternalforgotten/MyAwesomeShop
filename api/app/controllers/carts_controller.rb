class CartsController < ApplicationController
  authorize_resource
  before_action :auth_user
  before_action :load_cart

  def show
    render json: render_cart
  end

  def add
    product = Product.find(params[:id])
    if @cart.products.include?(product)
      carts_product = @cart.carts_products.find_by(product: product)
      carts_product.quantity += 1
      carts_product.save
    else
      @cart.products << product
    end
    @cart.update(value: @cart.value + product.value)
    render json: render_cart
  end

  def remove
    product = Product.find(params[:product_id])
    if @cart.products.include?(product)
      carts_product = @cart.carts_products.find_by(product: product)
      if carts_product.quantity > 1
        carts_product.quantity -= 1 
        carts_product.save
      else
        @cart.products.delete(product)
      end
    else
      render json: {error: "Этого продукта нет в корзине."}, status: :bad_request
      return
    end
    @cart.value -= product.value
    @cart.save
    render json: render_cart
  end

  def delete
    product = Product.find(params[:product_id])
    if @cart.products.include?(product)
      carts_product = @cart.carts_products.find_by(product: product)
      @cart.products.delete(product)
    else
      render json: {error: "Этого продукта нет в корзине."}, status: :bad_request
      return
    end
    @cart.value -= product.value * carts_product.quantity
    @cart.save
    render json: render_cart
  end


  protected
  def load_cart
    @cart = current_user.cart
  end

  def render_cart
    @cart.to_json(include: { 
                      carts_products: { only: %i[quantity],
                        include:{
                          product:{}
                        }},
                    })  
  end
  
end
