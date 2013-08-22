require 'spec_helper'

describe BlogsController do

  let(:blog) {FactoryGirl.create :blog}


  context "routing" do
    it {should route(:get, '/users/new').to :action => :new}
    it {should route(:post, '/users').to :action => :create}
  end
