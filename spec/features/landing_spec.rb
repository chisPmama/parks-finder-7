require 'rails_helper'

RSpec.describe "Landing Page" do
  before(:each) do
    json_response = File.read('spec/fixtures/tn_parks.json')
    stub_request(:get, "https://developer.nps.gov/api/v1/parks/?api_key=#{Rails.application.credentials.nps_gov[:key]}&stateCode=TN").
                with(
                  headers: {
                  'Accept'=>'*/*',
                  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                  'User-Agent'=>'Faraday v2.7.10'
                  }).
                to_return(status: 200, body: json_response, headers: {})

    visit root_path
  end

  describe 'Searching parks in a specific state' do
    it 'when selecting a specific state (Tennessee), it returns the total amount of parks' do
      select 'Tennessee', from: :state
      click_button "Find Parks"
      save_and_open_page
      expect(current_path).to eq(parks_path)
      expect(page).to have_content("Natchez Trace National Scenic Trail")
      expect(page).to have_content("Stones River National Battlefield")
      expect(page).to have_content("Total Results: 15")
      expect(page).to have_content("Directions")
      expect(page).to have_content("Description")
      expect(page).to have_content("Wednesday - 9:00AM - 4:00PM")
    end
  end
end