class UsersController < ApplicationController
  before_action :authenticate_user!
def index
    @users = User.all
end
  def show
    unless is_good_user?(params[:id])
      redirect_to user_path(current_user.id)
    end
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    puts params
    @user = current_user
    user_params = params.require(:user).permit(:first_name, :last_name, :description)
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def is_good_user?(id)
    current_user == User.find(params[:id])
  end
end
