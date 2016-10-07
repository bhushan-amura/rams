require 'rails_helper'

RSpec.describe "skills/show", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
