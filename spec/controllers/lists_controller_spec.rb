require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  let(:list) { FactoryGirl.create :list }
  let(:list_title) { 'Test List Title'}

  before do
    session[:user_id] = user.id

    post :create, params: { item: { text: list_title } }
  end
end

context 'with title text' do
  it '' do
  end
end

context 'without title text' do
  it '' do
  end
end
