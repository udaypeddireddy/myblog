class OrganizationProfile < ActiveRecord::Base
	attr_accessible :user_id, :is_admin, :role, :user_type
	belongs_to :user
end
