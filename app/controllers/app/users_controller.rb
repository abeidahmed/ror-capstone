class App::UsersController < App::ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
