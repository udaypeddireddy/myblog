class User < ActiveRecord::Base

attr_accessible	:email, :firstname, :lastname, :password_reset, :is_active, :password_salt, :password_hash

has_one :organization_profile

attr_accessor :password
before_save :encrypt_password
  
before_create :setdefault_pwd

scope :awaiting_approval, lambda{ where("is_approved = ?", false)}


def setdefault_pwd
self.password = SecureRandom.hex(3)  
self.password_salt = BCrypt::Engine.generate_salt
self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
end


 def is_admin?
    organization_profile.is_admin?
 end


def self.authenticate(email, password)
user = find_by_email(email)
if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
user
else
nil
 end
end
  
 def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
  "#{firstname} #{lastname}"
  end


end
