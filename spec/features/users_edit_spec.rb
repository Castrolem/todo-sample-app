require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, :type => :feature, :js => true do

  describe "User pages" do

    subject { page }

    describe "edit" do

      before do
        # log_in_as(user)
        visit edit_user_path(user)
      end

      let(:user) { FactoryGirl.create(:user) }

      describe "page" do
        it { expect(page).to have_selector('h1', text: "Update your profile") }
        it { expect(page).to have_title("Edit user") }
        it { expect(page).to have_link('change', href: 'http://gravatar.com/emails') }
      end

      context "with invalid information" do

        # since password is not required to change the user information, to make
        # an error in this test, we have to delete the loaded info from the user
        # before

        before do
          fill_in "Name",  with: ""
          fill_in "Email", with: ""
          click_button "Save changes"
        end

        it { expect(page).to have_content('error') }
      end

      context "with valid information" do
        let (:new_email) { "foo@bar.com" }
        let (:new_password) { "barfoo" }

        before do
          fill_in "Name",             with: user.name
          fill_in "Email",            with: new_email
          fill_in "Password",         with: new_password
          fill_in "Confirmation",     with: new_password
          click_button "Save changes"
        end

        it { expect(page).to_not have_title "Edit user" }
        it { expect(page.current_path).to eq user_path(user) }
        it { should_not have_button 'Save changes' }

      end
    end
  end
end
