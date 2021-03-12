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
  
  context 'organization users' do
    before do
      reg_usr = build(:user)
      allow(request.env['warden']).to receive(:authenticate!).and_return(reg_usr)
      allow(controller).to receive(:current_user).and_return(reg_usr)
    end

    # it 'redirects to the dashboard' do
    #   get :show, params: {id: 'fake'}
    #   expect(response).to be_successful
    #   get :new
    #   expect(response).to be_successful
    #   post :create
    #   expect(response).to be_successful 
    #   patch :update, params: {id: 'fake'}
    #   expect(response).to be_successful 
    #   get :edit, params: {id: 'fake'}
    #   expect(response).to be_successful 
    #   patch :update, params: {id: 'fake'}
    #   expect(response).to be_successful
    #   put :update, params: {id: 'fake'}
    #   expect(response).to be_successful
    # end
  end
      

end
