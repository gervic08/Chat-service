<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> [wip]feat(messages): add messages list
# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
<<<<<<< HEAD
#  email           :string           not null
#  is_admin        :boolean          default(FALSE)
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { 'User' }
    email { 'example@example.com' }
    password { 'example' }
    is_admin { false }
=======
#  deleted_at      :datetime
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :bigint           not null
#
# Indexes
#
#  index_users_on_deleted_at  (deleted_at)
#  index_users_on_email       (email) UNIQUE
#  index_users_on_role_id     (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { '12345' }
>>>>>>> [wip]feat(messages): add messages list
  end
end
