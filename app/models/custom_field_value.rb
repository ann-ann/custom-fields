# frozen_string_literal: true

class CustomFieldValue < ApplicationRecord
  belongs_to :custom_field
  belongs_to :user

  validates :value, presence: true, if: :is_required?
  validate :validate_value

  delegate :is_required?, to: :custom_field
  delegate :available_values, to: :custom_field
  delegate :select_field?, to: :custom_field
  delegate :number?, to: :custom_field

  private

  def validate_value
    if number?
      errors.add(:value, 'must be a number') unless value.is_a?(Numeric)
    elsif select_field?
      errors.add(:value, 'is not a valid option') unless available_values.include?(value)
    end
  end
end
