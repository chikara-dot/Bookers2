class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.reverse_order
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

 private

  def user_params
  params.require(:user).permit(:name,:title,:body)


  end
end