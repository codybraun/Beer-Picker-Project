class  RatingsController < ApplicationController

  before_action :find_rating, :only => [:show]
  before_action :require_user, :only => [:new, :create, :edit, :update, :destroy]
    
  def check_badge
   
  end  
    
  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to login to do that."
    end
  end
    
  def find_rating
    @rating= Rating.find_by(id: params["id"])
  end
  
  
  def index
    @ratings = Rating.joins("LEFT OUTER JOIN follows ON ratings.user_id = follows.followed_id").where(follows: {follower_id: session[:user_id]}).limit(200).page(params[:page]).per(20)
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    #not used
  end

  def create
    Rating.create description: params[:description], beer_id: params[:beer_id], stars: params[:stars], user: User.find_by(id: session[:user_id]), created: DateTime.now
    if (Rating.where(user_id: session[:user_id]).count) == 1
         Badge.create(user_id: session[:user_id], name: "FIRST REVIEW BADGE", image_url: "gold-medal.jpg", created: DateTime.now)
    end
    if (Rating.where({user_id: session[:user_id], created:(Time.now.midnight-1.day)..Time.now.midnight + 1.day}).count) == 3
             Badge.create(user_id: session[:user_id], name: "THREE REVIEWS IN ONE DAY", image_url: "gold-medal.jpg", created: DateTime.now)
    end
#    @brewery = Beer.find(params[:beer_id]).brewery
#    if (Beer.joins("LEFT JOIN beers ON beers.id = ratings.beer_id").where("beer.brewery": @brewery).joins(Rating.where({user_id: session[:user_id]}))count == 3
#               Badge.create(user_id: session[:user_id], name: "THREE REVIEWS OF ONE BREWERY", image_url: "gold-medal.jpg", created: DateTime.now)
#      end
    
    redirect_to "/beers/#{params[:beer_id]}", notice: "Added a review"
  end



end
