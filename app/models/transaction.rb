class Transaction < ApplicationRecord
  belongs_to :vehicle
  belongs_to :wash
end
