class AttiresController < ApplicationController
  def index
  end

  def create
    puts params[:title], params[:description]
    @attire = Attire.new(title: params[:title], description: params[:description], price: params[:price], category_id: params[:category_id], size_id: params[:size_id], colour_id: params[:colour_id], fabric_id: params[:fabric_id], situation_id: params[:situation_id], condition_id: params[:condition_id], brand_id: params[:brand_id], owner_id: current_user.id)
    if @attire.save
      puts ">>>>>> #{@attire.errors.messages}".red
      puts "Un vêtement a été ajouté"
      flash[:notice] = "Un vêtement a été ajouté."
      redirect_to user_path(current_user.id)
    else
      puts ">>>>>> #{@attire.errors.messages}".red
      puts "Erreur dans l'enregistrement.Ton produit a été refusé"
      flash[:alert] = "Erreur dans l'enregistrement.Ton produit a été refusé"
      render 'new'
    end
  end

  def show
    @attire = Attire.find(params[:id])
    #### / pour l'ActiveStorage /
    # @attire = Attire.with_attached_itempicture.find(params[:id])
    #### / end /
  end

  def edit
    @attire = Attire.find(params[:id])
  end

  def update
    @attire = Attire.find(params[:id])

    if @attire.update(title: params[:title], description: params[:description], price: params[:price])
    redirect_to @attire
    else
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
    @attire = Attire.find(params[:id])
    @attire.destroy
    redirect_to user_path(current_user.id)
  end

end
