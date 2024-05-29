class UsersController < ApplicationController

    skip_before_action:verify_authenticity_token
    skip_before_action :authenticate_user, only: [:create]
    

    
    def index
        @users = User.all
        render json: @users
    end
    def create
        
        @user = User.new(user_params)
        if @user.save
          render json: @user
            
        else
          render json: {error: "params has required"}
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :phone_number, :email, :password)
    end
end
