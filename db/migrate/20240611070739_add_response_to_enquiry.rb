class AddResponseToEnquiry < ActiveRecord::Migration[6.1]
  def change
    add_column :enquiries, :admin_response, :string
  end
end
