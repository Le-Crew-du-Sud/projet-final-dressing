class StaticPagesController < ApplicationController
  def index
    redirect_to attires_path if user_signed_in?
  end
  
  def crew
  end
end
