# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    tenant
    email { Faker::Internet.unique.email }
  end
end
