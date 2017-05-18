FactoryGirl.define do
  factory :vehicle do
    sequence(:plate) { |n| n.to_s + '00000'  }
    style { %w(car truck).sample }
    mud_in_bed false
    bed_up true
  end
end
