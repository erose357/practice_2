require 'rails_helper'

RSpec.feature "City forecast" do
  scenario "shows the 10 day forecast for a city" do
    VCR.use_cassette("forecast") do
      destinations = create_list(:destination, 5)
  #As a user
  #When I visit "/"
      visit '/'
  #And I click on a destination
      find(".picture", match: :first).click
  #Then I should be on page "/destinations/:id"
      expect(current_path).to eq("/destinations/#{destinations[0].id}")
  #Then I should see the destination's name, zipcode, description, and 10 day weather forecast
      expect(page).to have_content(destinations[0].name)
      expect(page).to have_content(destinations[0].zip)
      expect(page).to have_content(destinations[0].description)
  #The weather forecast is specific to the destination whose page I'm on
  #The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
      expect(page).to have_css(".weekday")
      expect(page).to have_css(".date")
      expect(page).to have_css(".high")
      expect(page).to have_css(".low")
      expect(page).to have_css(".conditions")
    end
  end
end

