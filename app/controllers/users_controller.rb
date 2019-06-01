class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show, :index, :edit, :update, :destroy]

  def show
  	@user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = 'successfully log out'
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
