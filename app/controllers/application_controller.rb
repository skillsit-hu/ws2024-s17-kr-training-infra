class ApplicationController < ActionController::API

  protected

  def encode_token(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        # body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        # HashWithIndifferentAccess.new body
        JWT.decode(token, Rails.application.secrets.secret_key_base)
      rescue
        nil
      end
    end
  end


  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorized
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def current_admin
    if decoded_token
      p '-----------------'
      p decoded_token
      user_id = decoded_token[0]['admin_id']
      @user = Admin.find_by(id: user_id)
    end
  end

  def authorized_admin
    unless !!current_admin
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  private

end
