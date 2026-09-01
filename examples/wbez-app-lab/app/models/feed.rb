# frozen_string_literal: true

class Feed < ApplicationRecord
  belongs_to :source
  has_many :stories, dependent: :nullify

  validates :url, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
end
