# frozen_string_literal: true

class Source < ApplicationRecord
  has_many :feeds, dependent: :destroy
  has_many :stories, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
