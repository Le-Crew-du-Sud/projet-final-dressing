class CartsController < ApplicationController

  def create
    puts ">>>>>>>>>>>>> #{params[:sale_price]}".red
    @cart = Cart.create(
      customer_id: current_user.id,
      attire_id: params[:attire_id],
      sale_price: params[:sale_price]
      )
    puts ">>>>>> #{@cart.errors.messages}".red
    puts @cart.id
    redirect_to cart_path(current_user.id)
  end

  def show
    @cart = Cart.where(customer_id: params[:id]).to_a
    puts "#{@cart.inspect}".red

  end

  def edit
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to cart_path(current_user.id)
  end
end
