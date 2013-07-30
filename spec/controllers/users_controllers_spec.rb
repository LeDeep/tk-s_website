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
      let(:valid_attributes) {{:name => 'Deep'}}
      let(:valid_parameters) {{:user => valid_attributes}}

      it 'creates a new user' do 
        expect {post :create, valid_parameters}.to change(User, :count).by(1)
      end

      before {post :create, valid_parameters}

      it {should respond_with 200}
    end

    context 'with invalid parameters' do 
      let(:invalid_attributes) {{:name => ''}}
      let(:invalid_parameters) {{:user => invalid_attributes}}

      before {post :create, invalid_parameters}

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
      let(:valid_attributes) {{:name => 'Deep'}}
      let(:valid_parameters) {{:id => user.id, :user => valid_attributes}}

      before {put :update, valid_parameters}

      it 'updates the user' do 
        User.find(user.id).name.should eq valid_attributes[:name]
      end

      it {should respond_with 200}
    end
  end
end
