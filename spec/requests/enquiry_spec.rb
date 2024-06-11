require 'rails_helper'

RSpec.describe "Enquiries", type: :request do
  let(:user) { FactoryBot.create(:user) }
  
  let(:loan_application) { FactoryBot.create(:loan_application, status: "approved") }
  let(:enquiry) { FactoryBot.attributes_for(:enquiry) }
  
  
  let(:token) { JwtToken.jwt_encode(user_id: user.id) }

  

  describe "POST #create" do
 
    it 'creates a loan application' do
      
      post '/enquiries', params: {enquiry: enquiry}, headers: { 'Authorization' => token }
      expect(response).to have_http_status(:success)
      
    end

    
  end
end
