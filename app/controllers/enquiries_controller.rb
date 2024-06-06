class EnquiriesController < ApplicationController

    skip_before_action:verify_authenticity_token
   
    def create
        
        @enquiry = Enquiry.new(enquiry_params)
        @enquiry.user_id = @current_user.id
        if @enquiry.save
          render json: @enquiry
            
        else
          render json: @enquiry.errors
        end
    end

    private

    def enquiry_params
        params.require(:enquiry).permit(:loan_application_id, :message)
    end
end
