class App::Tweets::LikesController < App::ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])

    if current_user.voted_up_on?(tweet)
      tweet.unliked_by(current_user)
    else
      tweet.liked_by(current_user)
    end

    redirect_back fallback_location: root_path
  end
end
