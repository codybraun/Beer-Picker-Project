class FollowsController < ApplicationController
  before_action :find_follow, :only => [:show]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]
    
  def check_badge
   #could add some badges for makin' friends
  end  
    
  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end
    
  def find_follow
    @follow= Rating.find_by(id: params["id"])
  end
  
  
  def index
  end

  def show
  end

  def new
    Follow.create follower_id: session[:user_id], followed_id: params[:user_id]
    redirect_to "/users/#{params[:user_id]}", notice: "Followed user"
  end

  def create
  end

  def destroy 
    Follow.find_by(follower_id: session[:user_id], followed_id: params[:user_id]).destroy
    redirect_to "/users/#{params[:user_id]}", notice: "Unfollowed user"
  end

end
