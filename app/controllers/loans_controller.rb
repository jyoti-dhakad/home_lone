class LoansController < ApplicationController

  skip_before_action:verify_authenticity_token
  
  def create
    
    @loan = LoanApplication.new(loan_params)
    @loan.user_id = @current_user.id
    calculate_emi_and_interest(@loan)
    if @loan.save
      render json: @loan
        
    else
      render json: @loan.errors
    end
  end

  def index
   
    if current_user
      @loans = current_user.loan_application.all
      render json: @loans
    
    end
  end

  def approve_loans
    debugger
    @loans = current_user.loan_application.where(status: "approved")
    
    if @loans.any?
      render json: @loans
    else
      render json: { message: "There are no approved loan applications!! Thank you!" }
    end
  end

  private

  def loan_params
    params.require(:loan).permit( :amount, :application_number, :year)
  end


  def calculate_emi_and_interest(loan)
    
    loan_amount = loan.amount
    loan_years = loan.year
    loan_months = loan_years * 12
    interest_rate_per_year = 0.01
  
    total_interest = loan_amount * interest_rate_per_year * loan_years
    total_amount_to_be_repaid = loan_amount + total_interest
  
    emi_per_six_month = 100*6
    total_emis = (total_amount_to_be_repaid / emi_per_six_month).ceil
  
    loan.interest = total_interest
    
    loan.total_loan = total_amount_to_be_repaid
    loan.emi = total_emis
  end
end
