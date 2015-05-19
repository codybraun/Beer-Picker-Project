class  RatingsController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
    
  end

  def create
    Rating.create description: params[:description], beer_id: params[:beer_id], stars: params[:stars]
    redirect_to "/beers/#{params[:beer_id]}"
  end



end
