class EnquiriesController < ApplicationController

  skip_before_action:verify_authenticity_token
  
  def create
    debugger
   
    
      @enquiry = Enquiry.new(enquiry_params)
      @loan = @enquiry.loan_application
      @enquiry.user_id = @current_user.id
    if @loan.status == "approved" 
      if @enquiry.save
        render json: @enquiry
          
      else
        render json: @enquiry.errors
      end
    else
      render json: {error:"after loan approval you can create enquiries.."}
    end
  end

  private

  def enquiry_params
      params.require(:enquiry).permit(:loan_application_id, :message)
  end
end
