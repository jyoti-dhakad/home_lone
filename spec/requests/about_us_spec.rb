require 'rails_helper'

RSpec.describe "AboutUs", type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/about_us'
      expect(response).to be_successful
    end
  end
end
