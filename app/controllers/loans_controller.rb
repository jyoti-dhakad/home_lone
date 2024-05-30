class LoansController < ApplicationController

    skip_before_action:verify_authenticity_token
   
    def create
        debugger
        @loan = LoanApplication.new(loan_params)
        @loan.user_id = @current_user.id
        if @loan.save
          render json: @loan
            
        else
          render json: {error: "params has required"}
        end
    end

    private

    def loan_params
        params.require(:loan).permit(:start_date, :end_date, :amount, :application_number)
    end
end
