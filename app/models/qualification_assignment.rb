class QualificationAssignment < ActiveRecord::Base
  belongs_to  :qualification
  belongs_to  :qualifiable, polymorphic: true
end
