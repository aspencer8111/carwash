require 'rails_helper'

feature 'lists all vehicles', :type => :feature do
  scenario 'successfully' do
    vehicle = create(:vehicle)
    visit vehicles_path
    expect(page).to have_content(vehicle.plate)
  end
end
