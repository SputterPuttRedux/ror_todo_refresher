require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:item) { FactoryGirl.create :item }
  let(:item_text) { 'Test item text.'}

  before do
    session[:user_id] = user.id

    post :create, params: { item: { text: item_text} }
  end
end

context 'with some validation' do
  it '' do
  end
end

context 'without some validation' do
  it '' do
  end
end
