class CurrentUsersController < ApplicationController
    

    def index
        render json: @current_user
    end
end
