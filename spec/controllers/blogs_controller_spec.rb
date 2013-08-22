require 'spec_helper'

describe BlogsController do



  context "routing" do
    it {should route(:post, '/blogs').to :action => :create}
    it {should route(:delete, '/blogs/1').to :action => :destroy, :id => 1}  
  end

  context 'submitting to the create action' do 
    before {post blogs_path}
    specify {response.should redirect_to(signin_path)}
  end

  context 'submitting to the destroy action' do 
    before { delete blog_path(FactoryGirl.build(:blog))}
    specify { response.should redirect_to(signin_path)}
  end
end
