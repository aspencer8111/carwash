require 'rails_helper'

feature 'vehicles #index' do
  context 'lists all vehicles', :type => :feature do
    scenario 'successfully' do
      vehicle = create(:vehicle)
      visit vehicles_path
      expect(page).to have_content(vehicle.plate)
    end
  end
end

feature 'vehicles #create' do
  context 'with all needed info', :type => :feature do
    scenario 'creates a new vehicle' do
      visit new_vehicle_path
      fill_in :vehicle_plate, with: 'aaaa'
      select 'Truck', from: :vehicle_style
      find("#Save").click
      expect(page).to have_content('aaaa')
    end
  end

  context 'without needed info', :type => :feature do
    scenario 'returns an eror' do
      visit new_vehicle_path
      find("#Save").click
      expect(page).to have_content('error')
    end
  end
end

feature 'vehicles #update', :type => :feature do
  context 'with all needed info', :type => :feature do
    scenario 'updates vehicle successfully' do
      vehicle = create(:vehicle)
      visit edit_vehicle_path(vehicle)
      fill_in :vehicle_plate, with: 'bbbb'
      find("#Save").click
      expect(page).to have_content('bbbb')
    end
  end

  context 'without removal of needed info', :type => :feature do
    scenario 'returns an eror' do
      vehicle = create(:vehicle)
      visit edit_vehicle_path(vehicle)
      fill_in :vehicle_plate, with: ''
      find("#Save").click
      expect(page).to have_content("Plate can't be blank")
    end
  end
end

feature 'vehicles #destroy', :type => :feature do
  scenario 'destroys vehicle' do
    vehicle = create(:vehicle)
    visit vehicles_path
    click_link 'destroy'
    expect(Vehicle.count).to eq(0)
  end
end
