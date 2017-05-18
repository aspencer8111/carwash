class Wash < ApplicationRecord
  has_one :charge
  has_one :vehicles, through: :charge
end
