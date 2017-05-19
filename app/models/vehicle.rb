class Vehicle < ApplicationRecord
  BASE_CAR_RATE = 5
  BASE_TRUCK_RATE = 10

  has_many :charges

  enum style: [:car, :truck]

  validates :plate, :style, presence: true
  validates :plate, uniqueness: true

  def base_rate
    return BASE_CAR_RATE if self.car?
    return BASE_TRUCK_RATE if self.truck?
  end

  def mud_surcharge
    self.mud_in_bed ? 2 : 0
  end
end
