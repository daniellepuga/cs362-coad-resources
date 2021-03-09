require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

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
      put :update, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      patch :activate, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_url)
      patch :deactivate, params: {id: 'fake'}
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
      patch :activate, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
      patch :deactivate, params: {id: 'fake'}
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
      post :create, params: { resource_category: attributes_for(:resource_category) }
      expect(response).to redirect_to resource_categories_path
    end

    describe 'edits resource category id' do
      specify { 
        resource_category = create(:resource_category)
        expect(get(:edit, params: {id: resource_category.id})).to be_successful
      }
    end

    describe 'gets show' do
      specify { 
        resource_category = create(:resource_category)
        expect(get(:show, params: {id: resource_category.id})).to be_successful
      }
    end

    describe 'can update resource category id' do
      specify { 
        resource_category = create(:resource_category)
        expect(patch(:update, params: {id: resource_category.id, resource_category: attributes_for(:resource_category)})).to redirect_to resource_category
      }
    end

    describe 'can activate resource category' do
      specify { 
        resource_category = create(:resource_category, :inactive)
        expect(patch(:activate, params: {id: resource_category.id})).to redirect_to resource_category
      }
    end

    describe 'can deactivate resource category' do
      specify { 
        resource_category = create(:resource_category, :active)
        expect(patch(:deactivate, params: {id: resource_category.id})).to redirect_to resource_category
      }
    end
  end
end

