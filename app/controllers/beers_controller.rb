class BeersController < ApplicationController

  before_action :find_beer, :only => [:show, :edit, :update]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]
  
  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end
    
  def find_beer
    @beer= Beer.find_by(id: params["id"])
  end
    
  def index
    @beers = Beer.limit(200).page(params[:page]).per(20)
    @recent = Beer.where(id: cookies["viewed"]).name
  end

  def show
  end

  def new
    @breweries = Brewery.all
  end

  def create
    @brewery = Brewery.find_by(id: params[:brewery])
    @beer = Beer.new(name: params[:name], image_url: params[:image_url], description: params[:description], brewery: @brewery, created: DateTime.now) 
    if @beer.valid?
      redirect_to root_url, notice:"Created beer " + params[:name]
      @beer.save
    else
      redirect_to new_beer_path, notice:"Did not create a beer: " + @beer.errors.full_messages.flatten.join(" ")
    end
  end

  def edit
  end

  def update
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
