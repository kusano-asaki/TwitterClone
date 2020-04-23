class TweetsController < ApplicationController
  def index
    @tweets  = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to new_tweet_path, notice: "つぶやきました"
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title,:content)
  end
end
