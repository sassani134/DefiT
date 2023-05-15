class Match < ApplicationRecord
  belongs_to :tournament, :inverse_of => :matches
  has_many :teams, :through => :tournament
end
