class Api::V1::UsersController < ApplicationController
  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity 
    end
  end
  # GET /user/:id
  def show
    render json: User.find(params[:id])
  end

  private

  # Only allow a trusted parameter "white list" through
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
