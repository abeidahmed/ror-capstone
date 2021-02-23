class App::UsersController < App::ApplicationController
  def show
    @user = User.find(params[:id])
    @user_tweets = @user.tweets.recent
  end
end
