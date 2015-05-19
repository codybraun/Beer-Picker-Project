class  BreweriesController < ApplicationController

  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
  end

  def new
    @brewery = Brewery.new
  end

  def create
    @brewery = Brewery.new(name: params[:name], created: params[:created], description: params[:description]) 
    if @brewery.valid?
      redirect_to "/breweries/", notice:"Added brewery " + params[:name]
      @brewery.save
    else
      redirect_to new_brewery_path, notice:"Did not create a brewery: " + @brewery.errors.full_messages.flatten.join(" ")
    end
    
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
    Brewery.delete(params[:id])
    redirect_to "/breweries/"
  end


end
