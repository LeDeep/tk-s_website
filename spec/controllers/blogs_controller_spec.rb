require 'spec_helper'

describe BlogsController do

  let(:blog) {FactoryGirl.create :blog}


  context "routing" do
    it {should route(:get, '/users/new').to :action => :new}
    it {should route(:post, '/users').to :action => :create}
  end

  context 'submitting to the create action' do 
    before {post blogs_path}
    specify {response.should redirect_to(signin_path)}
  end

  context 'submitting to the destroy action' do 
    before { delete blog_path(FactoryGirl.create(:blog))}
    specify { response.should redirect_to(signin_path)}
  end
end
