class ItempictureController < ApplicationController
  def create
    @item = Attire.find(params[:item_id])
    puts "#{@item}".red
    @item.itempicture.attach(params[:itempicture])
    redirect_to(attire_path(@item))
  end

  def destroy
    @itempicture = ActiveStorage::Attachment.find(params[:id])
    @itempicture.purge
    redirect_back(fallback_location: request.referer)
  end
end
