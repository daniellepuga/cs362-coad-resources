require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  it 'returns http success' do
    get :index
    expect(response).to have_http_status(:success)
  end
end
