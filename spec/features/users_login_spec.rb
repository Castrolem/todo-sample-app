require 'rails_helper'
require 'spec_helper'

RSpec.describe StaticPagesController, :type => :feature, :js => true do

  describe "User pages" do

    subject { page }

    describe "login" do

      before { visit login_path }

      let(:submit) { "Create my account" }
      let(:user) { FactoryGirl.create(:user) }

      describe "with invalid information" do
        before { click_button "Log in" }

        it { expect(page).to have_title "Log in" }
        it { expect(page).to have_selector('div.alert.alert-danger', text: 'Invalid') }
      end

      describe "with valid information" do
        before do
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          click_button "Log in"
        end

        it { expect(page).to have_title "Log in" }
        # it { expect(page.current_path).to eq user_path } missing :id key
        it { should_not have_link('Sign in', href: login_path) }
      end
    end
  end
end
