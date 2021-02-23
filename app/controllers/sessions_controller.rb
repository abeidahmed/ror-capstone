class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: username)

    if user&.authenticate(params[:password])
      sign_in(user)
      redirect_to app_tweets_path
    else
      render json: { errors: { invalid: ['credentials'] } }, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out_user

    redirect_to new_session_path
  end

  private

  def username
    params[:username].to_s.downcase
  end
end
