class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :admin, class_name:'Admin'
  has_one :candidate, class_name:'Candidate'
  has_one :company, class_name:'Company'
end
