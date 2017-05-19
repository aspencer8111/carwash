#create cars
10.times do |n|
  v = Vehicle.create(plate: "0000#{n}", style: 'car', mud_in_bed: false, bed_up: true )
end

#create trucks
10.times do |n|
  v = Vehicle.create(plate: "1000#{n}", style: 'truck', mud_in_bed: [true, false].sample, bed_up: [true, false].sample )
end

#create washes
50.times do
  v = Vehicle.all.sample
  v.washes.create(charge: v.calculate_charge)
end
