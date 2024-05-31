class LoanApplicationMailer < ApplicationMailer
    def application_approved(user)
        
        @user = user
        mail(to: @user.email, subject: "Your Loan Application has been Approved")
    end

    def profile_approved(user)
        
        @user = user
        mail(to: @user.email, subject: "Your profile has been Approved")
    end
end
