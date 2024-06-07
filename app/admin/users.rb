ActiveAdmin.register User do

  actions :all, :except => [:new, :destroy, :edit]
  permit_params :name, :email, :password_digest, :phone_number, :picture, :merital_status, :present_address, :parmanent_address, :category, :income_source, :annual_income, :status, :date_of_birth

  index do
    selectable_column
    id_column
    column "Picture" do |user|
        if user.picture.attached?
          image_tag(user.picture, size: "100x100")
        else
          "No Image"
        end
    end
    column :name
    column :email
    column :phone_number
    column :merital_status
    column :present_address
    column :parmanent_address
    column :category
    column :income_source
    column :annual_income
    column :status
    column :date_of_birth
    
    actions

  end

  action_item :approve, only: :show do
    if resource.status == 'pending' # Check if status is pending
      link_to 'Approve', approve_admin_user_path(resource), method: :put
    end
  end

  action_item :cancel, only: :show do
    if resource.status == 'pending' # Check if status is pending
      link_to 'Cancel', cancel_admin_user_path(resource), method: :put
    end
  end

  
  member_action :approve, method: :put do
    
    if resource.update(status: :approved)
        
        LoanApplicationMailer.profile_approved(resource).deliver_now
      
      redirect_to admin_user_path, notice: "user approved successfully."
    else
    
      redirect_to admin_user_path, alert: "Failed to approve status: #{resource.errors.full_messages.join('. ')}"
    end
  end

  member_action :cancel, method: :put do
    if resource.update(status: :cancelled)
      redirect_to admin_users_path, notice: "Status cancelled successfully."
    else
      redirect_to admin_users_path, alert: "Failed to cancel status: #{resource.errors.full_messages.join('. ')}"
    end
  end

   
 
  
end
