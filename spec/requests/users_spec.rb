require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get root_path }

    it 'Has HTTP Status OK' do
      expect(response).to have_http_status(:ok)
    end

    it 'Should Include Correct Header' do
      expect(response.body).to include('budgeTracker')
    end
  end
end