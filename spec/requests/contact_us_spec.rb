require 'rails_helper'

RSpec.describe "ContactUs", type: :request do

  
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/contact_us'
      expect(response).to be_successful
    end
  end
end
