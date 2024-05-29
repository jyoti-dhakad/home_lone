class ApplicationController < ActionController::Base
    include JwtToken
     before_action :authenticate_user
     before_action :authenticate_user, unless: -> { is_a?(ActiveAdmin::BaseController) }


    private

    

    def authenticate_user
        
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?
        begin
          raise JWT::DecodeError unless jwt_valid?(token)
          @decoded = jwt_decode(token)
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :not_found
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
    end
end
