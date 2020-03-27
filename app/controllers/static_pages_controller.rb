class StaticPagesController < ApplicationController
  def index
    redirect_to attires_path if user_signed_in?
  end

  def crew
  end

  def starting_page
  end
end
