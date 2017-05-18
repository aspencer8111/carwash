class Charge < ApplicationRecord
  belongs_to :vehicle
  belongs_to :wash
end
