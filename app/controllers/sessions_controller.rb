class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"]) # user existe & password valid
     session[:user_id] = user.id
     @current_user = User.find_by(id: session[:user_id])
     flash[:info] = "Bienvenue à toi, #{@current_user.first_name}"
     # redirige où tu veux, avec un flash ou pas
     redirect_to "/static/"
    else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
   end
  end

  def destroy
    # pour le logout
    session.delete(:user_id)
    puts session
    redirect_to "/static/"
  end

end
