class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  skip_before_action :authenticate_user!, only: :show

  def show
  end

  def profile
   @user = current_user
  end


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :email, :password)
  end


end
