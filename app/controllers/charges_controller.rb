class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @new_order = Cart.where(customer_id: current_user.id, order_id: 0)
    @customer = User.find(current_user.id)
  end

  def create
    @to_order = Cart.where(customer_id: params[:customer_id], order_id: 0)
    @sold_price = 0
    @to_order.each do |amount|
      @sold_price += amount.sale_price*100
    end

    @customer = Stripe::Customer.create({
      email: params[current_user.email],
      source: params[:stripeToken],
    })

    @charge = Stripe::Charge.create({
      customer: @customer.id,
      amount: Integer(@sold_price),
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    @pre_order = Order.create(
      stripe_customer_id: @charge.customer,
      sold_price: @sold_price,
      first_name: params[:first_name],
      last_name: params[:last_name],
      address: params[:address],
      city: params[:city],
      phone_number: params[:phone_number],
      email: params[:email],
      receipt: @charge.receipt_url,
      )

    @to_order.update(order_id: @pre_order.id)
    @to_order.each do |sold|
      Attire.where(id: sold.attire_id).update(is_sold: true)
    end

    @receipt = @charge.receipt_url

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_back(fallback_location: request.referer)
  end
end
