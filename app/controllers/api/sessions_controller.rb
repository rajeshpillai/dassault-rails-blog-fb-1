module Api
  class SessionsController < ApiController
    respond_to :json

    def create 

    end

    def login 
      # params.require(:session).permit(:email, :password)
      @email = params[:session][:email]
      password = params[:session][:password]

      
      @user = User.where(email: @email).first 

      
      if @user&.valid_password?(password) 
        render json: @user.as_json(only: [:email]).merge("token": @user.generate_jwt)
      else 
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end

    end

  end
end