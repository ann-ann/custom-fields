# frozen_string_literal: true

class CustomField < ApplicationRecord
  extend Enumerize

  belongs_to :tenant

  has_many :custom_field_values, dependent: :destroy

  accepts_nested_attributes_for :custom_field_values, allow_destroy: true

  validates :label, presence: true, length: { maximum: 250 }
  validates :name, presence: true, length: { maximum: 250 }
  validates :field_type, presence: true
  validates :available_values, presence: true, if: -> { select_field? }

  # normalize internal field name
  normalizes :name, with: -> { _1.strip.downcase }

  enumerize :field_type, in: [:string, :number, :select, :multiselect], predicates: true

  serialize :available_values, coder: YAML, type: Array

  def select_field?
    select? || multiselect?
  end
end
