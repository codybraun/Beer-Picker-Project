class BeersController < ApplicationController

  def index
    @beers = Beer.all
    @recent = Beer.where(id: cookies["viewed"]).name
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @breweries = Brewery.all
  end

  def create
    @brewery = Brewery.find_by(id: params[:brewery])
    @beer = Beer.new(name: params[:name], image_url: params[:image_url], description: params[:description], brewery: @brewery) 
    if @beer.valid?
      redirect_to root_url, notice:"Created beer " + params[:name]
      @beer.save
    else
      redirect_to new_beer_path, notice:"Did not create a beer: " + @beer.errors.full_messages.flatten.join(" ")
    end
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
