class UsersController < ApplicationController
  before_action :authorize, only: [:edit]
  def authorize
    #make sure the right user is editing an account details
    @user = User.find_by(id: params[:id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to root_url, notice: "You can't edit another user's account"
    end
  end
  
  def index
    #not actually used anywhere, don't need to limit or anything probably
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:username], image_url: params[:image_url], bio: params[:bio], password: params[:password], email: params[:email], created: DateTime.now) 
    if @user.valid?
      redirect_to root_url, notice:"Welcome to Beer Picker " + params[:username]
        @user.save
    else
      redirect_to new_user_path, notice:"Did not create a user: " + @user.errors.full_messages.flatten.join(" ")
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    @user.update username: params[:username], image_url: params[:image_url], bio: params[:bio], password: params[:password]
    redirect_to "/users/#{@user.id}/edit"
  end

  def destroy #not implemented yet
    User.delete(params[:id])
    redirect_to root_path
  end


end
