class StaticController < ApplicationController
  before_action :authenticate_user, only: [:new]

  def team
  end

  def contact
  end

### pour construire l'index ###
  def index
    @gossips = Gossip.all
  end
## pages individuelles des gossips
  def show_gossip
    @gossips = Gossip.all
    @users = User.all
  end
  def show_autor
    @gossips = Gossip.all
    @users = User.all
  end

## J2 - avec routes via resources
  def new

  end

  def create
    @gossip = Gossip.new(title: params["title"], gossip: params["content"], user_id: current_user.id)

    if @gossip.save # essaie de sauvegarder en base @gossip
      @gossips = Gossip.all
      render :index# si ça marche, il redirige vers la page d'index du site
    else
      render :new # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
    puts params['title']
    puts params['content']
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    puts params
    @gossip = Gossip.find(params[:id])
    post_params = params.permit(:title, :content)
      if @gossip.update(title: post_params["title"], gossip: post_params["content"])
        redirect_to "/static/"
      else
        render :edit
      end
  end

  def destroy
    @destroy = Gossip.find(params[:id])
    @destroy.destroy
    redirect_to "/static/"
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end #class
