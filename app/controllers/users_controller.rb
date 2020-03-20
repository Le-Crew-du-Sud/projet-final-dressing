class UsersController < ApplicationController
  # before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @Users = User.all
    redirect_to index_path
  end

  def search
    @users = User.all
    @users = @users.where("first_name LIKE ?", params[:q])

  end

  def cu_admin
    unless current_user.is_admin == true
      flash[:alert] = "Vous n'etes pas l'admin de ce compte."
      redirect_back(fallback_location: request.referer)
    end
  end
end
