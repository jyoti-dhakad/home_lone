ActiveAdmin.register LoanApplication, as: "Loan Request" do
  
  menu parent: "Loan"

   permit_params :status, :amount, :start_date, :end_date, :user_id

   actions :all, :except => [:new, :destroy, :edit]
  #
  action_item :approve, only: :show do
    if resource.status == 'pending' # Check if status is pending
      link_to 'Approve', approve_admin_loan_application_path(resource), method: :put
    end
  end

  action_item :cancel, only: :show do
    if resource.status == 'pending' # Check if status is pending
      link_to 'Cancel', cancel_admin_loan_application_path(resource), method: :put
    end
  end

  
  member_action :approve, method: :put do
    
    if resource.update(status: :approved)
      
      puts "Loan Request status updated successfully"
      redirect_to admin_loan_applications_path, notice: "Loan Request approved successfully."
    else
      puts "Failed to update Loan Request status: #{resource.errors.full_messages.join('. ')}"
      redirect_to admin_loan_applications_path, alert: "Failed to approve status: #{resource.errors.full_messages.join('. ')}"
    end
  end

  member_action :cancel, method: :put do
    if resource.update(status: :cancelled)
      redirect_to admin_loan_applications_path, notice: "Status cancelled successfully."
    else
      redirect_to admin_loan_applications_path, alert: "Failed to cancel status: #{resource.errors.full_messages.join('. ')}"
    end
  end


  
  
end