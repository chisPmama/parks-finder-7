require 'rails_helper'

RSpec.describe "Landing Page" do
  before(:each) do
    visit root_path
  end

  describe 'Searching parks in a specific state' do
    it 'when selecting a specific state (Tennessee), it returns the total amount of parks' do
      select 'Tennessee', from: :state
      click_button "Find Parks"
      
      expect(response.status).to eq(200)
      # expect(page).to have_content("Natchez Trace National Scenic Trail")
      # expect(page).to have_content("Stones River National Battlefield")
      # expect(page).to have_content("Total: 15")

    end
  end
end