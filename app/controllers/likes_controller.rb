class LikesController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def create
    puts params
    a = find_gossip.likes.new(user_id: current_user.id)
    puts params

     a.save # essaie de sauvegarder en base @gossip

#      @likes = Like.all
#      redirect_to "/static/gossips/#{params[:id]}"# si ça marche, il redirige vers la page d'index du site
#    else
#      render :new # sinon, il render la view new (qui est celle sur laquelle on est déjà)
#    end
    puts params
    puts a.errors.messages
  end

  def new

  end

  def destroy

  end

  private

  def find_gossip
    @gossip = Gossip.find(params["static_id"])

  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
