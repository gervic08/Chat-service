# frozen_string_literal: true

module Api
  module V1
    class MessagesController < ApplicationController
      before_action :authorize_request
      before_action :set_conversation
      after_action { pagy_headers_merge(@pagy) if @pagy }

      def index
        @pagy, @messages = pagy(
          @conversation.messages.all,
          items: params[:items] || 10,
          page: params[:page] || 1
        )
        @messages.order(created_at: :desc)
        render json: MessageSerializer.new(@messages).serializable_hash.to_json
      end

      private

      def set_conversation
        @conversation = Conversation.find(params[:id])
      end
    end
  end
end
