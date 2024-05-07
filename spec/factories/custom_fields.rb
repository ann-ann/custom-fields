FactoryBot.define do
  factory :custom_field do
    tenant
    field_type { CustomField.field_type.values.sample }
    available_values { Faker::Lorem.words(number: 5) }
    sequence(:name) { |n| "Custom Field #{Faker::Company.industry} #{n}" }
    sequence(:label) { |n| "Label #{Faker::Company.industry} #{n}" }

    trait :string do
      field_type { :string }
    end

    trait :multiselect do
      field_type { :multiselect }
    end
  end
end
