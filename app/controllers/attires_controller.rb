class AttiresController < ApplicationController
  def index
  end

  def create
    puts params[:title], params[:description]
    @attire = Attire.new(title: params[:title], description: params[:description], price: params[:price])
    if @attire.save
      puts "Un vêtement a été ajouté"
      flash[:notice] = "Un vêtement a été ajouté."
      redirect_to user_path(current_user.id)
    else
      puts "Erreur dans l'enregistrement.Ton produit a été refusé"
      flash[:alert] = "Erreur dans l'enregistrement.Ton produit a été refusé"
      render 'new'
    end
  end
  def show
    @attire = Attire.find(params[:id])
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

  def destroy
    @attire = Attire.find(params[:id])
    @attire.destroy
    redirect_to user_path(current_user.id)
  end



end
