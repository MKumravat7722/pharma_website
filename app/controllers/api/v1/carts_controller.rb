class Api::V1::CartsController < ApplicationController
  def show
    cart = Cart.first_or_create
    render json: cart, include: { cart_items: { include: :product } }
  end

  def add_item
    cart = Cart.first_or_create
    item = cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
    item.quantity ||= 0
    item.quantity += 1
    item.save

    render json: cart
  end
end
