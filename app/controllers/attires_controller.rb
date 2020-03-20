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
end
