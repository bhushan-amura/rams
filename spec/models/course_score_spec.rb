require 'rails_helper'

RSpec.describe CourseScore, type: :model do
  it { should belong_to(:qualification) }
end
