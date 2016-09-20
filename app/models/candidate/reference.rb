class Reference < ActiveRecord::Base
	include ForbiddenValues
	belongs_to :candidate

	validates :name, :presence => true, :length => { maximum: 20 }
	validates :email, :presence => true, :length => { maximum: 100 },
				:format => EMAIL_REGEX
	validates :contact,  :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
end