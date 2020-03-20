class UsersController < ApplicationController
  # before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
    redirect_to index_path
  end

  def search
    @user = User.where('first_name LIKE ?', "%" + params[:q] + "%") && User.where('last_name LIKE ?', "%" + params[:q] + "%") && User.where('email LIKE ?', "%" + params[:q] + "%")
  end

  def cu_admin
    unless current_user.is_admin == true
      flash[:alert] = "Vous n'etes pas l'admin de ce compte."
      redirect_back(fallback_location: request.referer)
    end
  end
end
