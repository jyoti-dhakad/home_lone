ActiveAdmin.register Enquiry do

  permit_params :message, :user_id, :loan_application_id, :admin_response
  
  

end
