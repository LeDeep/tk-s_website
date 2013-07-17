class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  before_save {email.downcase!}
  before_create :create_remember_token

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\w(\w*|\.*)@\w+.\w+/i},
            uniqueness: {case_sensitive: false}

  has_secure_password

  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

    private

      def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
      end
 


end