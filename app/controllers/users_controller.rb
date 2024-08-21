class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday)
  end
end
