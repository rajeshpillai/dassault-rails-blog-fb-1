module Api
  class ApiController < ActionController::API
    before_action :validate_user!
    before_action :validate_user!, except: [:index, :show, :login]
    
    private 
    def validate_user!
      if request.headers['Authorization'].present?
        # {'Authorization': 'Bearer <token>'
        token =  request.headers["Authorization"]
        token = token.split(" ")[1]  # Remove "Bearer"
        p token
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
          p "JWT_DECODE #{jwt_payload}"
          @current_user_id = jwt_payload['id']
        rescue => exception #JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          p exception
          head :unauthorized
        end
      else 
        head :unauthorized
      end
    end
  end
end
