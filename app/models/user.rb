# frozen_string_literal: true

class User < ApplicationRecord

  belongs_to :tenant
  validates :email, presence: true, uniqueness: true

  has_many :custom_field_values

  accepts_nested_attributes_for :custom_field_values, allow_destroy: true
end
