class StaticPagesController < ApplicationController
  def index
    redirect_to attires_path if user_signed_in?
    # @cart = Cart.all
  end
  def crew
  end
end
