class Experience < ActiveRecord::Base
  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields

  belongs_to :candidate

  validates :name, :format => REGEX_NAME_FORMAT, length: {maximum: 20}
  validates :end_date, :presence => true
  validates :description, :length => {maximum: 65535}
  validates :shift_type, :presence => true
  validates :email, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX

  validates_associated :candidate
end
