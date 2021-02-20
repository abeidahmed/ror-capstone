class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      sign_in(user)
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :password)
  end
end
