class Achievement < ActiveRecord::Base
	belongs_to :candidate

	validates :title, length: { maximum: 255 }
	validates :description, length: { maximum: 65535 }
end
