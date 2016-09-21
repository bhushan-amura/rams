class SkillAssignment < ActiveRecord::Base
  belongs_to :skill
  belongs_to :skillable, polymorphic: true
end
