require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "It should have a title" do
      visit '/'
      page.should have_content('Stopponline')
    end
    
    it "Should contain a signup/login/passengers/drivers links. The passengers 
      link should be active" do
      visit '/'
      page.should have_selector('li', text:'Sign up')
      page.should have_selector('li', text:'Login')
      page.should have_selector('li[class="active"]', text:'Passengers')
      page.should have_selector('li', text:'Drivers')
      page.should have_selector('li', text:'Contact')
    end
    
    it "Accessing the contact page should return a form" do
      visit '/contact'
      page.should have_selector('form > h2', text:'Contact');
    end
  end
end
