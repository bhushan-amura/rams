class Skill < ActiveRecord::Base
	
	has_and_belongs_to_many :candidates


  validates_associated :candidates 

  validates :name, presence:true
  validates :email, :presence => true, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX, :confirmation => true, 
			 :uniqueness => true

  validate :email_is_allowed

end
