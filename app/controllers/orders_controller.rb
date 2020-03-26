class OrdersController < ApplicationController


  def create
    puts "params.inspect = #{params.inspect}".red
    @order = Order.create(
      customer_id: params[:current.id],
      first_name: params[:first_name],
      last_name: params[:last_name],
      address: params[:address],
      city: params[:city],
      phone_number: params[:phone_number],
      email: params[:email]
      )
      redirect_to charges_path
  end


  def show
    @new_order = Cart.where(customer_id: params[:id])

  end

  def new
    @to_order = Cart.where(customer_id: params[:id])
    @to_order.each do |item_order|
      puts ">>> item_cart params.inspect = #{item_cart.inspect}".red
    end
    redirect_back(fallback_location: request.referer)
  end
end
