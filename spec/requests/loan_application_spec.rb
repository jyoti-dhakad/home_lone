require 'rails_helper'

RSpec.describe "LoanApplications", type: :request do
  let(:user) { FactoryBot.create(:user) }
  
  
  let(:token) { JwtToken.jwt_encode(user_id: user.id) }

  

  describe "POST #create" do
 
    it 'creates a loan application' do
      post '/loans', params: {loan: {amount:2000000, application_number:"123df2f", year:2}}, headers: { 'Authorization' => token }
      expect(response).to have_http_status(:success)
    end

    
  end
end
