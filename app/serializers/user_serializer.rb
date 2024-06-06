class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_number, :merital_status, :present_address, :parmanent_address, :category, :income_source, :annual_income, :picture_url

  

  def picture_url
    
    if object.picture.attached?
      Rails.application.routes.url_helpers.rails_blob_url(object.picture, only_path: true)
    else
      nil
    end
  end
end