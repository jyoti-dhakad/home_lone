require "jwt"



module JwtToken
    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  
    def jwt_encode(payload, exp: 7.days.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def jwt_decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      HashWithIndifferentAccess.new(decoded)
    end
  
    def jwt_blacklist(token)
      BlacklistedToken.create(token: token)
    end
  
    def jwt_valid?(token)
      !BlacklistedToken.exists?(token: token)
    end
end