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
    @attire_by_user = @user.attires #Attire.where(owner_id: @user)
    @attire_by_user_to_lend = Attire.where("owner_id = ? AND situation_id = ?", @user, 4)
    @attire_by_user_to_sell = Attire.where("owner_id = ? AND situation_id = ?", @user, 3)
  end

  def index
    @user = User.all
    redirect_to index_path
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
    @search_result = User.where("LOWER(CONCAT_WS(' ',first_name,last_name,email)) LIKE LOWER(?)", "%" + params[:q] + "%")
  end

  def cu_admin
    unless current_user.is_admin == true
      flash[:alert] = "Vous n'etes pas l'admin de ce compte."
      redirect_back(fallback_location: request.referer)
    end
  end
end
