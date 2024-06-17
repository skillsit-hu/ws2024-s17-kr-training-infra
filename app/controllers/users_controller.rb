class UsersController < ApplicationController
  before_action :authorized_admin, only: [:index]
  before_action :authorized, only: [:show]

  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # user profile for listing user's activities
  def show
    render json: @user
  end

  # create new user
  def create
    @user = User.new(user_params)
    @token = encode_token(user_id: @user.id)

    if @user.save
      render json: {
        user: @user,
        token: @token
      }, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def handle_invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
