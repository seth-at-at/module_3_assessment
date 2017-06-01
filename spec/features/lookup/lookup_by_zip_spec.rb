require "rails_helper"

RSpec.describe "return BestBuy's in our location" do
  context "by zip code" do
    it "returns stores" do
      visit root_path
      fill_in "zip", with: "80202"
      click_on "search"
      expect(current_path).to eq("/search")
      expect(page).to have_content("16 Total Stores")
      within ".all_stores" do
        expect(page).to have_css(".stores", count: 10)
        expect(page).to have_content "Store Name: BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER"
        expect(page).to have_content "City: DENVER"
        expect(page).to have_content "Phone: 303-758-5805"
        expect(page).to have_content "Distance: 3.45"
        expect(page).to have_content "Store Type: Big Box Store"
      end
    end
  end
end
