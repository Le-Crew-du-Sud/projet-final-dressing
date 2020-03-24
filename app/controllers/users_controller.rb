class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @attire = Attire.all
    @attire_by_user = Attire.where(owner_id: current_user)
    @attire_by_user_to_lend = Attire.where("owner_id = ? AND situation_id = ?", current_user, 4)
    @attire_by_user_to_sell = Attire.where("owner_id = ? AND situation_id = ?", current_user, 3)
    
  end


  def index
    @user = User.all
    redirect_to index_path
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
