class AttiresController < ApplicationController
  before_action :authenticate_user!

  def index
    @attires = Attire.with_attached_pictures.order(updated_at: :desc).where(is_sold: false, situation_id: 3)
  end

  def create
    @attire = Attire.new(attire_params)
    if @attire.save
      if params[:pictures]
        @attire.pictures.attach(params[:pictures])
      end
      flash[:notice] = "Un vêtement a été ajouté."
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "Erreur dans l'enregistrement.Ton produit a été refusé"
      redirect_back(fallback_location: request.referer)
    end
  end

  def show
    @all_attires = Attire.all
    @attire = Attire.with_attached_pictures.find(params[:id])
  end

  def edit
    @attire = Attire.with_attached_pictures.find(params[:id])
    @category_array = Category.all.map { |category| [category.kind, category.id] }
    @size_array = Size.all.map { |size| [size.measure, size.id] }
    @colour_array = Colour.all.map { |colour| [colour.tint, colour.id] }
    @fabric_array = Fabric.all.map { |fabric| [fabric.variety, fabric.id] }
    @situation_array = Situation.all.map { |situation| [situation.scope, situation.id] }
    @condition_array = Condition.all.map { |condition| [condition.state, condition.id] }
    @brand_array = Brand.all.map { |brand| [brand.trademark, brand.id] }
  end

  def update
    @attire = Attire.with_attached_pictures.find(params[:id])
    @category_array = Category.all.map { |category| [category.kind, category.id] }
    @size_array = Size.all.map { |size| [size.measure, size.id] }
    @colour_array = Colour.all.map { |colour| [colour.tint, colour.id] }
    @fabric_array = Fabric.all.map { |fabric| [fabric.variety, fabric.id] }
    @situation_array = Situation.all.map { |situation| [situation.scope, situation.id] }
    @condition_array = Condition.all.map { |condition| [condition.state, condition.id] }
    @brand_array = Brand.all.map { |brand| [brand.trademark, brand.id]}

    if @attire.update(title: params[:title], description: params[:description], price: params[:price], category_id: params[:category_id], size_id: params[:size_id], colour_id: params[:colour_id], fabric_id: params[:fabric_id], situation_id: params[:situation_id], brand_id: params[:brand_id], condition_id: params[:condition_id])
      flash[:notice] = "Un vêtement a été édité."
      redirect_to @attire
    else
      flash[:alert] = "Erreur dans l'enregistrement. Ton produit n'a PAS été édité"
      render :edit
    end
  end

  def new
    @category_array = Category.all.map { |category| [category.kind, category.id] }
    @size_array = Size.all.map { |size| [size.measure, size.id] }
    @colour_array = Colour.all.map { |colour| [colour.tint, colour.id] }
    @fabric_array = Fabric.all.map { |fabric| [fabric.variety, fabric.id] }
    @situation_array = Situation.all.map { |situation| [situation.scope, situation.id] }
    @condition_array = Condition.all.map { |condition| [condition.state, condition.id] }
    @brand_array = Brand.all.map { |brand| [brand.trademark, brand.id] }
  end

  def destroy
    @attire = Attire.with_attached_pictures.find(params[:id])
    @attire.destroy
    flash[:notice] = "Un vêtement a été supprimé."
    redirect_to user_path(current_user.id)
  end

  def del_picture
    @itempicture = ActiveStorage::Attachment.find(params[:id])
    @itempicture.purge
    redirect_back(fallback_location: request.referer)
  end

  def update_pictures
    @attire = Attire.with_attached_pictures.find(params[:id])
    if params[:pictures]
      @attire.pictures.attach(params[:pictures])
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def attire_params
    params.permit(:title, :description, :price, :category_id, :size_id, :colour_id, :fabric_id, :situation_id, :condition_id, :brand_id, :owner_id)
  end

end
