class ContactUsController < ApplicationController

    skip_before_action :authenticate_user

    def index
        @contact = ContactU.all
        render json: @contact
    end
    
end
