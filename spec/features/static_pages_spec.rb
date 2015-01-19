require 'rails_helper'

RSpec.describe StaticPagesController, :type => :feature, :js => true do


  describe "Static Pages" do

    let(:base_title) { "To do App" }

    describe "GET home" do
      before (:each) do
        visit root_path
      end

      it "should have correct title" do
        expect(page).to have_title "Home | #{base_title}"
      end
    end

    describe "GET help" do
      before (:each) do
        visit help_path
      end

      it "should have correct title" do
        expect(page).to have_title "Help | #{base_title}"
      end
    end
  end
end
