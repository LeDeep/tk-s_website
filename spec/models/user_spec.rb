require 'spec_helper'

describe User do

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
    it {should validate_presence_of :password_confirmation}
    it {should allow_value("password").for :password}
    it {should_not allow_value("stuff").for :password}
    it {should allow_value("foo@bar.com").for :email}
    it {should_not allow_value('random').for :email}
    it {should validate_uniqueness_of :email}
  end



end
