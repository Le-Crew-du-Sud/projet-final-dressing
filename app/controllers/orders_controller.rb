class OrdersController < ApplicationController



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
