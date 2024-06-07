ActiveAdmin.register ContactU do

  menu parent: "Pages"

  permit_params :phone, :email, :address
  actions :all, :except => [:new, :destroy, :edit]
 
end
