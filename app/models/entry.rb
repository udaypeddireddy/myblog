class Entry < ActiveRecord::Base
	belongs_to :category 
	has_many :comments
	
	
def self.most_recent
first(:order => 'id DESC') # or whatever query you need to get the most recent
end
	
end
