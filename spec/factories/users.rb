# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  is_admin        :boolean          default(FALSE)
#  name            :string           not null
#  password_digest :string
#  settings        :string
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

    string = '{ upcase: false, downcase: true, normalize: false }'
    settings { Hash[string.split('\n').map { |word| word = word.split(':'); [word[0].to_sym, word[1]] }] }
  end
end
