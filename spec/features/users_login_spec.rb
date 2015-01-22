require 'rails_helper'

RSpec.describe UsersController, :type => :feature, :js => true do

  describe "User pages" do

    subject { page }

    describe "login" do

      before { visit login_path }

      let(:user) { FactoryGirl.create(:user) }

      context "with invalid information" do
        before { click_button "Log in" }

        it { expect(page).to have_title "Log in" }
        it { expect(page).to have_selector('div.alert.alert-danger', text: 'Invalid') }
      end

      context "with valid information" do
        before do
          fill_in "Email",        with: user.email
          fill_in "Password",     with: user.password
          click_button "Log in"
        end

        it { expect(page).to_not have_title "Log in" }
        it { expect(page.current_path).to eq user_path(user) }
        it { should_not have_link('#{user.name}', href: login_path) }
      end
    end
  end
end
