require 'spec_helper'

describe UsersController do

  context "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    context "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    context "with valid information" do
      before do
       let(:user) { FactoryGirl.create :user) }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end