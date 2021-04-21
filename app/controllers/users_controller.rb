class UsersController < ApplicationController
  def show
  end

  def index
    @user = current_user
  end

 private

  def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)


  end
end