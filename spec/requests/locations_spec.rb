require 'spec_helper'

describe "Locations" do
  describe "Locations by prefix" do
    before do
      FactoryGirl.create(:location)
      FactoryGirl.create(:location, name: 'Budapest')
      FactoryGirl.create(:location, name: 'Brasov')
    end
  
    it "Should return locations by prefix" do
      visit '/locations/by_prefix/bu'
      page.should have_selector('li', text:'Bucharest')
      page.should have_selector('li', text:'Budapest')
    end
  end
end
