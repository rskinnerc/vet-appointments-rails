class UsersController < ApplicationController
  def create
    if User.exists?(name: user_params[:name])
      @user = User.where(name: user_params[:name])
    else
      @user = User.new(name: user_params[:name])
      render json: @user.errors.full_messages unless @user.save
    end
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
