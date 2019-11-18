class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
end
