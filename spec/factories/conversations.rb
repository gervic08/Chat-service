# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_conversations_on_deleted_at  (deleted_at)
#
FactoryBot.define do
  factory :conversation do
    state { 'open' }
  end
end
