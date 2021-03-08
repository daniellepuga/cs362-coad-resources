require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  context 'unauthenticated users' do
    it 'redirects to the sign_in screen' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'organization users' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'should be successful' do
      get :index
      expect(response).to be_successful
    end
  end

  context 'admin users' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    it 'should be successful' do
      get :index
      expect(response).to be_successful
    end
  end
end
