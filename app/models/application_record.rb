class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

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
end
