class QualificationAssignment
include Mongoid::Document
  # concerns
  
  # callbacks
  
  # associations
  belongs_to  :qualification
  belongs_to  :qualifiable, polymorphic: true


  # validations
end
