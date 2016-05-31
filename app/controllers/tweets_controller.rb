class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
	end

	def update
    @tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
			redirect_to tweets_path, notice: "Your tweet has been updated."
		else
			render "edit"
		end
	end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, :notice => "Your tweet has been deleted"
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      render "new"
    end

  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :description)
  end
end
