require 'rails_helper'

RSpec.describe "skills/index", type: :view do
  before(:each) do
    assign(:skills, [
      Skill.create!(),
      Skill.create!()
    ])
  end

  it "renders a list of skills" do
    render
  end
end
