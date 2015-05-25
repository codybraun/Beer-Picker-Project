class SessionsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to "/beers/", notice: "Welcome back " + User.find_by(email: params[:email]).username
      else      
         redirect_to root_url, notice: "Uknown email or password"
      end
    else
      redirect_to root_url, notice: "Uknown email or password"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end


end
