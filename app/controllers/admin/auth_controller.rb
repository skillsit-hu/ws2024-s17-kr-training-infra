class Admin::AuthController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login 
    @user = Admin.find_by!(name: login_params[:name])

    if @user.authenticate(login_params[:password])
      @token = encode_token(admin_id: @user.id)
      render json: {
        user: UserSerializer.new(@user),
        token: @token
      }, status: :accepted
    else
      render json: {message: 'Incorrect password'}, status: :unauthorized
    end

  end

  private
  def login_params
    params.permit(:name, :password)
  end

  def handle_record_not_found(e)
    render json: { message: "Admin account doesn't exist" }, status: :unauthorized
  end
end
