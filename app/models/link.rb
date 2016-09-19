class Link < ActiveRecord::Base
	belongs_to :candidate
	validates :type, :presence => true, :length => { maximum: 50 }
	validates :url, :presence => true
end
