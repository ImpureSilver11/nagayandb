# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    sequence(:id)
    sequence(:path, &:to_s)
    title { 'string' }
    tags_id { [] }
    :entertainer
  end
end
