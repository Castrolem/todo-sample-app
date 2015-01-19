require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do


  describe "Static Pages" do

    describe "GET home" do
      before (:each) do
        visit root_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET help" do
      before (:each) do
        visit help_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end
  end
end
