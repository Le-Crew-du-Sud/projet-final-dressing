class AttiresController < ApplicationController
  def index
    @attires = Attire.with_attached_pictures.order(updated_at: :desc).all
  end

  def create
    puts "params.inspect = #{params.inspect}".red
    @attire = Attire.new(attire_params)
    if @attire.save
      if params[:pictures]
        @attire.pictures.attach(params[:pictures])
      end
      puts ">>>>>> #{@attire.errors.messages}".red
      puts "pictures = #{@attire.pictures.count}".red
      puts "Un vêtement a été ajouté"
      flash[:notice] = "Un vêtement a été ajouté."
      redirect_to user_path(current_user.id)
    else
      puts ">>>>>> #{@attire.errors.messages}".red
      puts "Erreur dans l'enregistrement.Ton produit a été refusé"
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
      puts "Un vêtement a été édité"
      flash[:notice] = "Un vêtement a été édité."
      redirect_to @attire
    else
      puts "Erreur dans l'enregistrement. Ton produit n'a PAS été édité"
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
    puts "Un vêtement a été supprimé"
    flash[:notice] = "Un vêtement a été supprimé."
    redirect_to user_path(current_user.id)
  end

  def del_picture
    puts "del_picture params.inspect = #{params.inspect}".red
    @itempicture = ActiveStorage::Attachment.find(params[:id])
    puts "del_picture itempicture.inspect = #{@itempicture.inspect}".red
    @itempicture.purge
    redirect_back(fallback_location: request.referer)
  end

  def update_pictures
    puts "update_pictures params.inspect = #{params.inspect}".red
    @attire = Attire.with_attached_pictures.find(params[:id])
    puts "update_pictures attire.inspect = #{@attire.inspect}".red
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
