class QualificationAssignment < ActiveRecord::Base
  belongs_to  :qualifiable, polymorphic: true
end
