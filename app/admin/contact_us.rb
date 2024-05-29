ActiveAdmin.register ContactU do

  menu parent: "Pages"

   permit_params :phone, :email, :address
 
  
end
