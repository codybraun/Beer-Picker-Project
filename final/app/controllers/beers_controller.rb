class BeersController < ApplicationController

  def index
    @beers = Beer.all
    @recent = Beer.where(id: cookies["viewed"]).name
  end

  def show
    @beer = Beer.find(params[:id])
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
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update name: params[:name],
                 image_url: params[:image_url],
                 description: params[:description]

    redirect_to "/beers/#{@beer.id}"
  end

  def destroy
    Beer.delete(params[:id])
    redirect_to root_path
  end


end
