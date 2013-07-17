require 'spec_helper'

describe UsersController do

  context "signup" do

    before { visit signup_path }


    context "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create my account" }.not_to change(User, :count)
      end
    end

    context "with valid information" do
       let(:user) { FactoryGirl.create(:user) }
     

      it "should create a user" do
        expect { click_button "Create my account" }.to change(User, :count).by(1)
      end
    end
  end
end