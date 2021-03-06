class UsersController < ApplicationController
before_action :corect_user, only: [:edit]

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

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
    if @user.save
     redirect_to user_path(@users)
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = 'You have updated user successfully'
     redirect_to user_path(@user)
    else
      render :edit
    end
  end

 private
  def corect_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end


  def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)


  end
end