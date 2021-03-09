require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'unauthenticated users' do
    it 'handles different situations for tickets' do
      get :new
      expect(response).to be_successful
      post :capture, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      post :release, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
    end
  end

    # describe 'creates new' do
    #   specify { 
    #     ticket = create(:ticket)
    #     expect(post(:create, params: { id: ticket.id, ticket: attributes_for(:ticket) })).to be_successful
    #   }
    # end

  context 'organization users' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'redirects to the dashboard' do
      get :new
      expect(response).to be_successful
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
    end
  end

    # describe 'creates a post' do
    #   specify { 
    #     ticket = create(:ticket)
    #     expect(post(:create, params: { id: ticket.id, ticket: attributes_for(:ticket) })).to be_successful
    #   }
    # end

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

