class AttiresController < ApplicationController

  def show
    @attire = Attire.with_attached_itempicture.find(params[:id])
  end

end
