require 'rails_helper'

RSpec.describe "skills/edit", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!())
  end

  it "renders the edit skill form" do
    render

    assert_select "form[action=?][method=?]", skill_path(@skill), "post" do
    end
  end
end
