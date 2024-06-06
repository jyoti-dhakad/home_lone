require 'rails_helper'

RSpec.describe "CurrentUsers", type: :request do
  let(:user) { FactoryBot.create(:user) }
  
  
  let(:token) { JwtToken.jwt_encode(user_id: user.id) }

  

  describe "GET #index" do
 
    it 'current user' do
      get '/current_user', headers: { 'Authorization' => token }
      expect(response).to have_http_status(:success)
    end

    
  end
end
