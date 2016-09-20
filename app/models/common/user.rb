class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include ForbiddenValues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX, :confirmation => true, 
			 :uniqueness => true
  
  validate :email_is_allowed
end
