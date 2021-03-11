require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'unauthenticated users' do
    before do
      user = build(:user)
      allow(controller).to receive(:current_user).and_return(user)
    end
    it 'redirects the following requests to sign in' do
      get :new
      expect(response).to be_successful
      post :capture, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      post :release, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      patch :close, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
    end
  end

  context 'organization users' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    # it 'should be successful' do
    #   get :index
    #   expect(response).to be_successful
    # end
  end

  class FakeTicket
    def get_ticket
      :ok
    end

    def release_ticket
      :ok
    end

    def close_ticket
      :ok
    end
  end
end

