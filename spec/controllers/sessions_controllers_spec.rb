require 'spec_helper'

describe SessionsController do 

  before do 
    @user = FactoryGirl.build(:user)
  end

  context 'routing' do 
    it {should route(:get, '/sessions/new').to :action => :new}
    it {should route(:post, '/sessions').to :action => :create}
    it {should route(:delete, '/signout').to :action => :destroy}  
  end

  context 'GET new' do 
    it 'returns http success' do 
      get 'new'
      response.should be_success
    end
  end

  context 'POST create' do 
    context 'with valid parameters' do 
      before {post :create, {:session => {:email => @user.email, :password => @user.password}}}
      
      it {should respond_with 200}
    end

    context 'with invalid parameters' do 
      before {post :create, {:session => {:email => '', :password => ''}}}

      it {should render_template :new}
    end
  end

  context 'DELETE destroy' do 
    before {post :create, {:session => {:email => @user.email, :password => @user.password}}}
    before {delete :destroy, {:id => @user.id}}

    it {should set_session(:user_id).to(nil)}
    it {should redirect_to root_path}
  end
end
