ActiveAdmin.register Enquiry do

  permit_params :message, :user_id, :loan_application_id
  #
  
  
  action_item :Read, only: :show do
    debugger
    if resource.status == 'Unread' # Check if status is pending
      link_to 'Read', Read_admin_enquiry_path(resource), method: :put
    end
  end

  

  
  member_action :Read, method: :put do
    
    if resource.update(status: :Read)
      debugger
      
      puts "enquiry status updated successfully"
      redirect_to admin_enquiry_path, notice: "enquiry read successfully."
    else
      puts "Failed to update enquiry status: #{resource.errors.full_messages.join('. ')}"
      redirect_to admin_enquiry_path, alert: "Failed to read status: #{resource.errors.full_messages.join('. ')}"
    end
  end

  
  
end
