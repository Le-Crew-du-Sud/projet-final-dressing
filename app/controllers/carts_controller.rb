class CartsController < ApplicationController

  def create
    puts ">>>>>>>>>>>>> #{params[:price]}".red
    @cart = Cart.create(
      customer_id: params[:customer_id],
      attire_id: params[:attire_id],
      sale_price: params[:sale_price]
      )
    puts ">>>>>> #{@cart.errors.messages}".red
    redirect_back(fallback_location: request.referer)
  @order = Order.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    country: params[:country],
    address: params[:address],
    postcode: params[:postcode],
    city: params[:city],
    province: params[:province],
    phone_number: params[:phone_number],
    email: params[:email]
  )
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
