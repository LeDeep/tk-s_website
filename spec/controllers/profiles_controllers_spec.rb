require 'spec_helper'

describe ProfilesController do 
  let(:profile) {FactoryGirl.create :profile}

  context "routing" do
    it {should route(:get, '/profiles/1').to :action => :show, :id => 1}
    it {should route(:get, '/profiles').to :action => :index}
    it {should route(:get, '/profiles/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/profiles/1').to :action => :update, :id => 1}  
  end

  context 'GET show' do 
    before {get :show, :id => profile.id}

    it {should render_template :show}
  end

  context 'GET edit' do 
    before {get :edit, :id => profile.id}

    it {should render_template :edit}
  end

  context 'PUT update' do 
    let(:valid_attributes) {{:location => 'San Francisco, CA'}}
    let(:valid_parameters) {{:id => profile.id, :profile => valid_attributes}}

    before {put :update, valid_parameters}

    it 'updates the users profile' do 
      Profile.find(profile.id).location.should eq valid_attributes[:location]
    end

   it {should redirect_to profile_path(profile.id)}
  end

end
