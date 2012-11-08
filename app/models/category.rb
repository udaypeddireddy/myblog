class Category < ActiveRecord::Base
	has_many :entries
	scope :recent, limit(5).order('categories.created_at DESC')
end
