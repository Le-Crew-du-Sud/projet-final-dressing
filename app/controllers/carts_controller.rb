class CartsController < ApplicationController

  def create
    puts ">>>>>>>>>>>>> #{params[:sale_price]}".red
    @cart = Cart.create(
      customer_id: params[:customer_id],
      attire_id: params[:attire_id],
      sale_price: params[:sale_price]
      )
    puts ">>>>>> #{@cart.errors.messages}".red
    redirect_back(fallback_location: request.referer)

  end

  def show
    @cart = Cart.where(customer_id: current_user.id).to_a
  end

  def edit
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to cart_path
  end

end
