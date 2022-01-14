# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/messages', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { create(:user, name: 'test2', email: 'test2@example.com', password: '12345') }
  let(:conversation) { create(:conversation) }
  let(:message1) { create(:message) }
  let(:valid_token) { { 'Authorization' => AuthTokenService.call(user_id).to_s } }

  context 'with valid authorization token' do
    it 'renders a successful response' do
      get api_v1_conversations_messages_url(conversation.id), headers: valid_token, as: :json
      expect(response).to have_http_status(:ok)
    end
  end

  context 'without valid authorization token' do
    it 'returns an error for invalid or unexisting token' do
      get api_v1_conversations_messages_url(conversation.id), headers: {}, as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
