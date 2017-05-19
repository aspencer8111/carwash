require 'rails_helper'

feature 'washes' do
  context 'for a car', :type => :feature do
    scenario 'costs 5 dollars' do
      vehicle = create(:vehicle, style: 'car')
      visit vehicle_path(vehicle)
      click_link 'Wash'
      expect(page).to have_content('The Total Cost will be 5.0')
    end
  end

  context 'for a truck', :type => :feature do
    scenario 'costs 10 dollars' do
      vehicle = create(:vehicle, style: 'truck')
      visit vehicle_path(vehicle)
      click_link 'Wash'
      expect(page).to have_content('The Total Cost will be 10.0')
    end

    scenario 'costs 2 dollars more for muddy bed' do
      vehicle = create(:vehicle, style: 'truck', mud_in_bed: true)
      visit vehicle_path(vehicle)
      click_link 'Wash'
      expect(page).to have_content('The Total Cost will be 12.0')
    end

    scenario 'does not show wash option for if bed is down' do
      vehicle = create(:vehicle, style: 'truck', mud_in_bed: true, bed_up: false)
      visit vehicle_path(vehicle)
      expect(page).to_not have_content('Wash')
    end
  end

  context 'vehicles', :type => :feature do
    scenario 'get half off on return trips' do
      vehicle = create(:vehicle, style: 'car')
      wash1 = vehicle.washes.create(charge: vehicle.calculate_charge)
      visit vehicle_path(vehicle)
      click_link 'Wash'
      expect(page).to have_content('The Total Cost will be 2.5')
    end

    scenario 'rejects car with plate 1111111' do
      vehicle = create(:vehicle, style: 'car', plate: '1111111')
      visit vehicle_path(vehicle)
      click_link 'Wash'
      find('#Save').click
      expect(page).to have_content('stolen')
    end
  end
end
