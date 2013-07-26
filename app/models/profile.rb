class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_family_memory, :location, :birthday, :user_id

  belongs_to :user

  def age
    Date.today.year - self.birthday.try(:year)
  end
end

