class Profile < ActiveRecord::Base
  attr_accessible :bio, :email, :favorite_family_memory, :name

  belongs_to :user
end
