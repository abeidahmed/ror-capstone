class App::TweetsController < App::ApplicationController
  def create
    tweet = current_user.tweets.build(tweet_params)

    if tweet.save
      # do
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
