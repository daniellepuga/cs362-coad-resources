require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

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
      post :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
    end
  end
  
  context 'organization users' do
    let(:user) { create(:user) }
    before(:each) { sign_in(user) }

    it 'redirects to the dashbord' do
      get :index
      expect(response).to redirect_to(dashboard_url)
      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      get :new
      expect(response).to redirect_to(dashboard_url)
      post :create
      expect(response).to redirect_to(dashboard_url) 
      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url) 
      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url) 
      post :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url) 
    end
  end

  context 'admin users' do
    let(:user) { create(:user, :admin) }
    before(:each) { sign_in(user) }

    it 'is successful as admin' do
      get :index
      expect(response).to be_successful
      get :new
      expect(response).to be_successful
      post :create, params: { region: attributes_for(:region) }
      expect(response).to redirect_to regions_path
    end

    describe 'can get region id' do
      specify { 
        region = create(:region)
        expect(get(:edit, params: {id: region.id})).to be_successful
      }
    end

    describe 'can get show' do
      specify { 
        region = create(:region)
        expect(get(:show, params: {id: region.id})).to be_successful
      }
    end

    describe 'can redirect post destroy' do
      specify { 
        region = create(:region)
        expect(post(:destroy, params: {id: region.id})).to redirect_to regions_path
      }
    end

    describe 'can update region id and its attriubutes' do
      specify { 
        region = create(:region)
        expect(patch(:update, params: {id: region.id, region: attributes_for(:region)})).to redirect_to regions_path + '/' + region.id.to_s
      }
    end
    
  end
end