class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: username)

    if user&.authenticate(params[:password])
      sign_in(user)
    else
      render json: { errors: { invalid: ['credentials'] } }, status: :unprocessable_entity
    end
  end

  private

  def username
    params[:username].to_s.downcase
  end
end
