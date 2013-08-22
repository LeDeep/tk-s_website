require 'spec_helper'

describe "Blog pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "blog creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a blog" do
        expect { click_button "Post" }.not_to change(Blog, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'blog_content', with: "yada yada yada" }
      it "should create a blog" do
        expect { click_button "Post" }.to change(Blog, :count).by(1)
      end
    end
  end
end