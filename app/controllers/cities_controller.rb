class CitiesController < ApplicationController
  def index
  end

  def show
    @gossips = Gossip.all
    @array_all = @gossips
    @city = City.find(params['id'].to_i)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def create
  end

  def new
  end
end
