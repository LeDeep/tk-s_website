class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save :create_remember_token

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\w(\w*|\.*)@\w+.\w+/i},
            uniqueness: {case_sensitive: false}

 

  validates :password, presence: true, length: {minimum: 8}


 private

   def create_remember_token
     self.remember_token = SecureRandom.urlsafe_base64
   end
 


end
