class User
include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #, :confirmable, :lockable


  # Associations
  has_one :admin 
  has_one :candidate
  has_one :company 


  ROLE = [:candidate, :company, :admin]

  # Instance methods
  def is?(requested_role)
    self.role == requested_role.to_s
  end

  def info
    self.admin||self.candidate||self.company
  end

  def destroy
    self.info.destroy
    super
  end
end
