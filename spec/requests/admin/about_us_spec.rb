require 'rails_helper'

RSpec.describe "Admin::AboutUs", type: :request do
  before do
    @admin_user = AdminUser.create!(email: "admin#{SecureRandom.uuid}@example.com", password: 'password')
    
    @about_u = AboutU.create!(content: "Sample content") 
  end

  def authenticate_admin_user
    post admin_user_session_path, params: { admin_user: { email: @admin_user.email, password: 'password' } }
    follow_redirect!  
  end

  describe 'GET #index' do
    context 'when about us fetch successfully' do
      before do
        authenticate_admin_user
        get '/admin/about_us'
      end

      it 'responds with status 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
