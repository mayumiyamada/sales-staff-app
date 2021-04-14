class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index,  only: [:edit, :update, :destroy]
 
  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?  
       @tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @tweet.update(tweet_params)
    redirect_to action: :index
  end

  def show
  end


  private
  def tweet_params
    params.require(:tweet).permit(:hotel_name, :content, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id = @tweet.user_id 
  end
  
end
