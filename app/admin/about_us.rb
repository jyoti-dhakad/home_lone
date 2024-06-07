ActiveAdmin.register AboutU do

  menu parent: "Pages"
  permit_params :content

  actions :all, :except => [:new, :destroy, :edit]

  index do
    selectable_column
    column :content
    actions
  end
 
  
end
