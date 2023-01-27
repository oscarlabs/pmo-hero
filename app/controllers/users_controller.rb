class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[ create ]
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users, status: 200
  end

  # GET /users/1
  def show
    render json: @user, status: 200
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors, status: 422
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :user_name, :email, :password, :password_confirmation)
    end
end
