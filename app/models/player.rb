class Player < ApplicationRecord
  belongs_to :job
  belongs_to :team, :inverse_of => :players

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3 }

  validates_presence_of :job
  validates_presence_of :team
end
