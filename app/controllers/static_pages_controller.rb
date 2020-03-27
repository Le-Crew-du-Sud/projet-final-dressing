class StaticPagesController < ApplicationController
  def index
    redirect_to attires_path if user_signed_in?
  end

  def crew
  end

  def ethos
    @attires = Attire.all
  end
end
