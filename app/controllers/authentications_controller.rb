class AuthenticationsController < ApplicationController
    skip_before_action :authenticate_user, except: [:logout]

    skip_before_action:verify_authenticity_token
    
    def login
        debugger
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            payload = { user_id: @user.id, timestamp: Time.now.to_i }
            token = JWT.encode(payload, Rails.application.secrets.secret_key_base)
            # time = Time.now + 24.hours.to_i
            render json: { token: token, email: @user.email }, status: :ok
          
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end
      
    
    def logout
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?
        jwt_blacklist(token)
        puts "Token blacklisted: #{token}"
        render json: { message: 'Logged out successfully' }, status: :ok
    end

    # private
    # def user_params
    #    params.require(:user).permit(:email,:password)
    # end
end
