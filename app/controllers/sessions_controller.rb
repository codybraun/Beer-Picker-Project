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
      if (params[:password]==user.password)
         cookies['current_user'] = user.id    
        redirect_to "/beers/", notice: "Welcome back " + User.find_by(email: params[:email]).username
      else      
         redirect_to root_url, notice: "Unknown password."
      end
    else
      redirect_to root_url, notice: "No account associated with address " + params[:email]
    end
  end

  def destroy
    cookies['current_user'] = ""
    redirect_to root_path, notice: "Signed out successfully"
  end


end
