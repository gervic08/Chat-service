# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'api/v1/messages', type: :request do
  let(:user1) { create(:user, email: 'test32@g.com') }
  let(:conversation1) { create(:conversation) }
  let(:message1) { create(:message) }
  let(:conversation_user1) { create(:conversation_user, conversation: conversation1, user: user1) }
  let(:valid_attributes) { attributes_for(:message) }
  let(:valid_token) { { 'Authorization' => AuthTokenService.call(user1.id).to_s } }

  context 'with valid authorization token' do
    it 'creates a new message and renders a successful response' do
      post api_v1_conversation_messages_url(conversation1.id),
           params: valid_attributes,
           headers: valid_token, as: :json
      expect(response).to have_http_status(:created)
      expect{
        post :create, { post: message1 }
      }.to change(Message, :count).by(1)
    end

    it 'shows the message´s list and renders a successful response' do
      conversation_user1
      get api_v1_conversation_messages_url(conversation1.id), headers: valid_token, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  context 'without valid authorization token' do
    it 'returns an error for invalid or unexisting token' do
      post api_v1_conversation_messages_url(conversation1.id),
           params: valid_attributes,
           headers: {}, as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
