require 'spec_helper'

describe UsersController do

  let(:user) {FactoryGirl.create :user}


  context "routing" do
    it {should route(:get, '/users/new').to :action => :new}
    it {should route(:get, '/users/1').to :action => :show, :id => 1}
    it {should route(:post, '/users').to :action => :create}
    it {should route(:get, '/users').to :action => :index}
    it {should route(:get, '/users/1/edit').to :action => :edit, :id => 1}
    it {should route(:put, '/users/1').to :action => :update, :id => 1}  
  end

  context 'GET new' do 
    before {get :new}
    it {should render_template :new}
  end

  context 'GET show' do 
    before {get :show, :id => user.id}

    it {should render_template :show}
  end

  context 'POST create' do 
    context 'with valid parameters' do 
      before {post :create, {:name => user.name}}


      it 'creates a new user' do 
        expect {post :create, {:name => user.name}}.to change(User, :count).by(1)
      end


      it {should respond_with 200}
    end

    context 'with invalid parameters' do 
      before {post :create, {:name => ''}}

      it {should render_template :new}
    end
  end

  context 'GET index' do  
    before {get :index}

    it {should render_template :index}
  end

  context 'GET edit' do 
    before {get :edit, :id => user.id}

    it {should render_template :edit}
  end

  context 'PUT update' do 
    context 'with valid parameters' do 
      before {put :update, {:id => user.id, :name => user.name}}

      it 'updates the user' do 
        User.find(user.id).name.should eq user.name
      end

      it {should respond_with 200}
    end
  end
end
