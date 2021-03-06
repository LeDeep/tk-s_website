class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save :create_remember_token

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/},
            uniqueness: {case_sensitive: false}

 

  validates :password, presence: true, length: {minimum: 8}

  after_validation { self.errors.messages.delete(:password_digest) }

  has_one :profile
  has_many :blogs

  after_create :make_profile




  
 private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def make_profile
   self.create_profile
  end
 


end
