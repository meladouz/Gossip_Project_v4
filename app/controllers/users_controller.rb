class UsersController < ApplicationController

  def create
    # !! city pas renseigné par utilisateur !!
    @user = User.new(params_user)
    @user.city_id = "1"
# name: params["name"], first_name: params["first_name"], age: params["age"], email: params["email"], password: params["password"], city_id: "1")

    if @user.save # essaie de sauvegarder en base @user
      @users = User.all
      redirect_to '/sessions/new/'# si ça marche, il redirige vers 1 page de connexion
    else
      render :new
    end
    puts params["password"]
    puts @user.errors.messages
  end

  def new
    @user = User.new
  end

  def index
    # code quelque chose qui permet d'afficher le dashboard de l'utilisateur
    @users = User.all
  end

  private

  def params_user # pour le formulaire
    params.permit(:name, :first_name, :age, :password, :email)
  end

end
