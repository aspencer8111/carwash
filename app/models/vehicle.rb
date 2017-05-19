class Vehicle < ApplicationRecord
  has_many :charges
  has_many :washes, through: :charges

  enum style: [:car, :truck]

  validates :plate, :style, presence: true
  validates :plate, uniqueness: true
end
