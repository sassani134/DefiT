class Team < ApplicationRecord
  has_many :players, :inverse_of => :team
  has_and_belongs_to_many :tournaments
  validates :name, presence: true
  validates :town, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :town, length: { minimum: 3 }
  validates :name, length: { maximum: 50 }

  accepts_nested_attributes_for :players, allow_destroy: true

end
