require 'spec_helper'

describe Profile do
  
  context 'accessibility' do 
    it {should allow_mass_assignment_of :bio}
    it {should allow_mass_assignment_of :favorite_family_memory}
    it {should allow_mass_assignment_of :location}
    it {should allow_mass_assignment_of :birthday}
    it {should allow_mass_assignment_of :user_id}
  end

  context 'associations' do 
    it {should belong_to :user}
  end

  


end
