require 'rails_helper'

RSpec.describe "SiteLayouts", :type => :request do
  describe "Layout links" do
    it "shows the correct paths" do
      visit root_path
      expect(page).to have_selector('a', text: 'Home')
      expect(page).to have_selector('a', text: 'Help')
    end
  end
end
