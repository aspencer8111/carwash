class Vehicle < ApplicationRecord
  # Rates
  BASE_CAR_RATE = 5
  BASE_TRUCK_RATE = 10
  MUD_SURCHARGE = 2
  RETURN_CUSTOMER_DISCOUNT_MULTIPLIER = 0.5

  # Associations
  has_many :washes

  # Validations
  validates :plate, :style, presence: true
  validates :plate, uniqueness: true

  # Style
  enum style: [:car, :truck]

  # Methods
  def calculate_charge
    (base_rate + mud_surcharge) * return_customer_discount
  end

  def base_rate
    return BASE_CAR_RATE if self.car?
    return BASE_TRUCK_RATE if self.truck?
  end

  def mud_surcharge
    self.mud_in_bed ? MUD_SURCHARGE : 0
  end

  def return_customer_discount
    self.washes.count >= 1 ? RETURN_CUSTOMER_DISCOUNT_MULTIPLIER : 1
  end
end
