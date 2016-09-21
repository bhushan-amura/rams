class QualificationAssignment < ActiveRecord::Base

  # concerns
  
  # callbacks
  
  # associations
    belongs_to  :qualification
    belongs_to  :qualifiable, polymorphic: true

  # validations
end
