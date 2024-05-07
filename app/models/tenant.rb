# frozen_string_literal: true

class Tenant < ApplicationRecord

  validates :name, presence: true

  has_many :custom_fields, dependent: :destroy

  accepts_nested_attributes_for :custom_fields, allow_destroy: true
end
