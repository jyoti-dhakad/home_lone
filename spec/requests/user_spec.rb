require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_params) { FactoryBot.attributes_for(:user, status: 'pending') }
  
  
  
  describe 'POST #create' do
    it 'returns a success response' do
      post '/users', params: { user: user_params }
      expect(response).to have_http_status(:success)
    end
  end
end
