class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:username], image_url: params[:image_url], bio: params[:bio], password: params[:password], email: params[:email]) 
    if @user.valid?
      redirect_to root_url, notice:"Welcome to Beer Picker " + params[:username]
    else
      redirect_to new_user_path, notice:"Did not create a user: " + @user.errors.full_messages.flatten.join(" ")
    end
  end

  def edit
    @user = cookies['current_user']
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
