require 'rails_helper'

feature 'lists all vehicles', :type => :feature do
  scenario 'successfully' do
    visit vehicles_path
    expect(page).to have_content('Vehicles')
  end
end
