# frozen_string_literal: true

<<<<<<< HEAD
# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  detail     :string           not null
#  modified   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
=======
>>>>>>> [wip]feat(messages): add messages list
class MessageSerializer
  include JSONAPI::Serializer
  attributes :detail
end
