class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_family_memory, :location, :birthday, :user_id

  validates :bio, length: {maximum: 160}
  validates :favorite_family_memory, length: {maximum: 160}
  belongs_to :user

  def age
    if self.birthday != nil
      Date.today.year - self.birthday.try(:year)
    else
      ''
    end
  end
end

