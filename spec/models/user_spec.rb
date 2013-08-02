require 'spec_helper'

describe User do

  before do 
    @user = FactoryGirl.create(:user)
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}

  end

  context 'validations' do 
    it {should validate_presence_of :email}
    it {should validate_presence_of :name}
    it {should validate_presence_of :password}
    it {should allow_value("password").for :password}
    it {should_not allow_value("stuff").for :password}
    it {should allow_value("foo@bar.com").for :email}
    it {should_not allow_value('random').for :email}
    it {should validate_uniqueness_of :email}
  end

  context 'associations' do 
    it {should have_one :profile}
    it {should have_many :blogs}
  end

  context 'callbacks' do 
    it 'creates a profile after the user is created' do 
      @user.profile.should_not be_nil
    end
  end

  context 'blog ordering' do 

    let(:first_blog) {FactoryGirl.create(:blog, user: @user, created_at: 1.day.ago)}
    let(:second_blog) {FactoryGirl.create(:blog, user: @user, created_at: 1.hour.ago)}
  
    
    it 'orders blogs in descending order from most recent to oldest' do 
      @user.blogs.should == [second_blog, first_blog]
    end
  end

end
