class Candidate::Experience < ActiveRecord::Base
  
  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :candidate

  #validations
  validates :name, :format => REGEX_NAME_FORMAT, length: {maximum: 20}
  validates :end_date, :presence => true
  validates :description, :length => {maximum: 65535}
  validates :shift_type, :presence => true
  validates :email, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX
end
