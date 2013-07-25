class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_family_memory

  belongs_to :user
end
