class User < ActiveRecord::Base

attr_accessible	:email, :firstname, :lastname, :password_reset, :is_active, :password

has_one :organization_profile
before_create :setdefault_pwd

scope :awaiting_approval, lambda{ where("is_approved = ?", false)}


def setdefault_pwd
self.password = SecureRandom.hex(3)  
end


 def is_admin?
    organization_profile.is_admin?
 end


def self.authenticate(email, password)
user = find_by_email(email)
pwd = find_by_password(password)
if user && pwd
user
else
nil
 end
end
  


  def full_name
  "#{firstname} #{lastname}"
  end


end
