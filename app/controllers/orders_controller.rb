class OrdersController < ApplicationController



  def show
    @cart = Cart.where(customer_id: params[:id]).to_a
    puts "#{@cart.inspect}".red
  end
end
