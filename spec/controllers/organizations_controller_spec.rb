require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'unauthenticated users' do
    it 'redirects to the sign_in screen' do
      get :index
      expect(response).to redirect_to(new_user_session_url)
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      get :new
      expect(response).to redirect_to(new_user_session_url)
      post :create
      expect(response).to redirect_to(new_user_session_url) 
      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      put :update, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  class FakeMailer
    def new_organization_application
      false
    end
  end
  
  context 'users' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'redirects to the dashboard' do
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      get :new
      expect(response).to be_successful
      get :index
      expect(response).to be_successful 
      post :create, params: { organization: {name: 'fake'} }
      expect(response).to be_successful
    end

    it 'redirects to a path after creation' do
      allow(UserMailer).to receive(:with).and_return FakeMailer.new
      expect(post(:create, params: { organization: attributes_for(:organization) })).to redirect_to(organization_application_submitted_path)
    end

    describe 'it can get edit' do
      specify {
        user.organization = create(:organization, :approved)
        user.save
        expect(get(:edit, params: {id: user.organization.id} )).to be_successful
      }
    end

  end
      

end
