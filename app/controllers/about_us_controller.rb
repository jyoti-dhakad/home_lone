class AboutUsController < ApplicationController

    skip_before_action :authenticate_user
    def index
        @about = AboutU.all
        render json: @about
    end
end
