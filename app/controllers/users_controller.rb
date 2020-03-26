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
    @attire_by_user = Attire.where(owner_id: current_user)
    @attire_by_user_to_lend = Attire.where("owner_id = ? AND situation_id = ?", current_user, 4)
    @attire_by_user_to_sell = Attire.where("owner_id = ? AND situation_id = ?", current_user, 3)
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

  # def update_avatar
  #   puts "params = #{params[:user][:avatar].inspect}".red
  #   #if @user.avatar
  #     @user = params[:user]
  #     @user.avatar.attach
  #   #end
  #   redirect_back(fallback_location: request.referer)
  # end

  def del_avatar
    @user = User.with_attached_avatar.find(params[:id])
    @user.avatar.purge
    redirect_back(fallback_location: request.referer)
  end

  def search
    # @search_user_mail = User.where("LOWER(email) LIKE LOWER(?)", "%" + params[:q] + "%")
    # @search_user_first_name = User.where("LOWER(first_name) LIKE LOWER(?)", "%" + params[:q] + "%")
    # @search_user_last_name = User.where("LOWER(last_name) LIKE LOWER(?)", "%" + params[:q] + "%")
    @search_result = User.where("LOWER(CONCAT_WS(' ',first_name,last_name,email)) LIKE LOWER(?)", "%" + params[:q] + "%")
  end

  def cu_admin
    unless current_user.is_admin == true
      flash[:alert] = "Vous n'etes pas l'admin de ce compte."
      redirect_back(fallback_location: request.referer)
    end
  end
end
