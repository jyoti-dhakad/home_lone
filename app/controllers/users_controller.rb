class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user, only: [:create]

    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, each_serializer: UserSerializer
        else
            render json: { error: "params are required" }
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :phone_number, :email, :password, :merital_status, :present_address, :parmanent_address, :category, :picture, :income_source, :annual_income)
    end
end
