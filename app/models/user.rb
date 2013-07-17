class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  before_save {email.downcase!}

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\w(\w*|\.*)@\w+.\w+/i},
            uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true

end
