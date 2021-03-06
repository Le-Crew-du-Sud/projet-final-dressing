class CartsController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = Cart.create(
      customer_id: current_user.id,
      attire_id: params[:attire_id],
      sale_price: params[:sale_price],
      order_id: 0
      )
    flash[:notice] = "Un vêtement a été ajouté au panier."
    redirect_to cart_path(current_user.id)
  end

  def show
    @cart = Cart.where(customer_id: params[:id], order_id: 0).to_a
  end

  def edit
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = "Un vêtement a été supprimé du panier."
    redirect_to cart_path(current_user.id)
  end
end
