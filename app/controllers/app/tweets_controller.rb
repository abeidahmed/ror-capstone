class App::TweetsController < App::ApplicationController
  def index
    @tweets = Tweet.includes(:author).recent
    @follow_suggestions = current_user.not_following_users.recent
  end

  def create
    tweet = current_user.tweets.build(tweet_params)

    if tweet.save
      redirect_to app_tweets_path
    else
      render json: { errors: tweet.errors }, status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
