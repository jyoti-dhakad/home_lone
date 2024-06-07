ActiveAdmin.register LoanApplication do
  
  menu parent: "Loans"

   permit_params :status, :amount, :emi, :user_id, :application_number

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
      LoanApplicationMailer.application_approved(resource.user).deliver_now
      puts "Loan Request status updated successfully"
      redirect_to admin_loan_application_path, notice: "Loan Request approved successfully."
    else
      puts "Failed to update Loan Request status: #{resource.errors.full_messages.join('. ')}"
      redirect_to admin_loan_application_path, alert: "Failed to approve status: #{resource.errors.full_messages.join('. ')}"
    end
  end

  member_action :cancel, method: :put do
    if resource.update(status: :cancelled)
      redirect_to admin_loan_applications_path, notice: "Status cancelled successfully."
    else
      redirect_to admin_loan_applications_path, alert: "Failed to cancel status: #{resource.errors.full_messages.join('. ')}"
    end
  end


  scope "All", default: true do |leaves|
    leaves
  end
  scope "Yesterday", group: :date do |scope|
    scope.where("DATE(created_at) = ?", Date.yesterday)
  end
  scope "Today" do |leaves|
    leaves.where("DATE(created_at) = ?", Date.today)
  end
  
  
end
