class SkillAssignment < ActiveRecord::Base

  # concerns
  
  # callbacks

  # associations
    belongs_to :skill
    belongs_to :skillable, polymorphic: true

  # validations
end
