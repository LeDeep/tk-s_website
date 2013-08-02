require 'spec_helper'

describe Blog do
  context 'accessibility' do 
    it {should allow_mass_assignment_of :content}
    it {should allow_mass_assignment_of :title}
  end

  context 'validations' do 
    it {should validate_presence_of :user_id}
    it {should_not allow_value(nil).for :user_id}
    it {should validate_presence_of :title}
    it {should allow_value("Today's Blog").for :title}
    it {should_not allow_value('').for :title}
    it {should_not allow_value("Today's Blog" * 100).for :title}
    it {should validate_presence_of :content}
    it {should_not allow_value('').for :content}

  end

  context 'associations' do 
    it {should belong_to :user}
  end

end
