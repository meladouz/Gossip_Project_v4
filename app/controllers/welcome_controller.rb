class WelcomeController < ApplicationController
  def name
    @name = params[:name]
    puts "Coucou ce sont les params : #{params}"
  end
end
