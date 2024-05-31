class ApplicationController < ActionController::Base
    include JwtToken
    before_action :authenticate_user, unless: -> { is_a?(ActiveAdmin::BaseController) || (is_a?(ActiveAdmin::Devise::SessionsController))}
    
    
    private
    
    def authenticate_user
        header = request.headers['Authorization']
        token = header.split(' ').last if header.present?
    
        if token.blank?
          render json: { errors: 'Token not present' }, status: :unauthorized
          return
        end
    
        unless jwt_valid?(token)
          render json: { errors: 'Invalid token' }, status: :unauthorized
          return
        end
    
        begin
          @decoded = jwt_decode(token)
          @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :not_found
        rescue JWT::DecodeError => e
          render json: { errors: 'Invalid token' }, status: :unauthorized
        end
    end

    def current_user
        
        @current_user
    end
end