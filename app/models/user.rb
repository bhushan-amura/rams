class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_one :admin 
  has_one :candidate
  has_one :company 

  # Instance methods
  def info
    self.admin||self.candidate||self.company
  end



end
