class Vehicle < ApplicationRecord
  has_many :charges
  has_many :washes, through: :charges
end
