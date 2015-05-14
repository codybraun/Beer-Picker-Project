class  BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
  end

  def create
    Beer.create name: params[:name],
                 image_url: params[:image_url],
                 description: params[:description]
    redirect_to root_path
  end

  def edit
    @brewery = Brewery.find(params[:id])
  end

  def update
    @brewery = Brewery.find(params[:id])
    @brewery.update name: params[:name], description: params[:description]
    redirect_to "/breweries/#{@breweries.id}"
  end

  def destroy
    Beer.delete(params[:id])
    redirect_to root_path
  end


end
