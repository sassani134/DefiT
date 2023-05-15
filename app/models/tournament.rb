class Tournament < ApplicationRecord
  has_many :matches, :inverse_of => :tournament
  has_and_belongs_to_many :teams
  validates :name, presence: true

  accepts_nested_attributes_for :matches, allow_destroy: true
  accepts_nested_attributes_for :teams, allow_destroy: true
end
