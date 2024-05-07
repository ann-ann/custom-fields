FactoryBot.define do
  factory :custom_field_value do
    user
    custom_field
    value { Faker::Lorem.word }
  end
end
