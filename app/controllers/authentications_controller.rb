class AuthenticationsController < ApplicationController
    skip_before_action :authenticate_user, except: [:logout, :change_password]

    skip_before_action:verify_authenticity_token
    
    def login
        
        @user = User.find_by_email(params[:email])
        if @user.status == 'approved'

            if @user&.authenticate(params[:password])
                payload = { user_id: @user.id, timestamp: Time.now.to_i }
                token = JWT.encode(payload, Rails.application.secrets.secret_key_base)
                # time = Time.now + 24.hours.to_i
                render json: { token: token, email: @user.email }, status: :ok
            
            else
              render json: { error: 'Unauthorized' }, status: :unauthorized
            end
        else
            render json: { error: 'After admin approval you can see your credentials.. Thank You.. !!!' }
        end
    end
      
    
    def logout
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?
        jwt_blacklist(token)
        puts "Token blacklisted: #{token}"
        render json: { message: 'Logged out successfully' }, status: :ok
    end

    def change_password
        @user = current_user
        
        if @user.authenticate(params[:password])
          if @user.update(password: params[:new_password])
            render json: { message: 'Password updated successfully' }, status: :ok
          else
            render json: { error: 'Failed to update password' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Current password is incorrect' }, status: :unauthorized
        end
    end

    
end
