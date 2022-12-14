class UsersController < ApplicationController
  def create
    if User.exists?(name: user_params[:name])
      @user = User.find_by(name: user_params[:name])
    else
      @user = User.new(name: user_params[:name])
      unless @user.save
        render json: @user.errors.full_messages, status: 400
        return
      end
    end
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
