class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @attire = Attire.all
    @all_users = User.all
    @all_cats = Category.all
    @all_brands = Brand.all
    @all_cities = City.all
    @all_colours = Colour.all
    @all_conditions = Condition.all
    @all_fabrics = Fabric.all
    @all_orders = Order.all
    @all_situations = Situation.all
    @all_sizes = Size.all
    @attire_by_user = @user.attires
    @dressing_by_user = @user.attires.where.not(situation_id: 1)
    @attire_by_user_to_lend = @user.attires.where(situation_id: 4)
    @attire_by_user_to_sell = @user.attires.where(situation_id: 3)
    @items_purchased = Cart.where(customer_id: params[:id]).where("order_id > 0")
  end

  def destroy
    @admin_destroy_user = User.find(params[:id])
    @admin_destroy_user.destroy
    redirect_to user_path(current_user.id)
  end

  def del_avatar
    @user = User.with_attached_avatar.find(params[:id])
    @user.avatar.purge
    redirect_back(fallback_location: request.referer)
  end

  def search
    @search_result_user = User.where("LOWER(CONCAT_WS(' ',first_name,last_name,email)) LIKE LOWER(?)", "%" + params[:q] + "%")
    @search_result_attire = Attire.where("LOWER(CONCAT_WS(' ',title,description)) LIKE LOWER(?)", "%" + params[:q] + "%")
  end

  def cu_admin
    unless current_user.is_admin == true
      flash[:alert] = "Vous n'etes pas l'admin de ce compte."
      redirect_back(fallback_location: request.referer)
    end
  end
end
