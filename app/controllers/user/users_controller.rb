class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to  user_user_path(current_user)
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to  user_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(@user.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit( :nickname, :name, :postal_code,:prefecture_code, :address_city, :address_street,
    :phone_number, :email, :image)
  end
end
