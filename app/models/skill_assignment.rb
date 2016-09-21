class SkillAssignment < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true
end
