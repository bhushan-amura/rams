require 'rails_helper'

RSpec.describe "skills/new", type: :view do
  before(:each) do
    assign(:skill, Skill.new())
  end

  it "renders new skill form" do
    render

    assert_select "form[action=?][method=?]", skills_path, "post" do
    end
  end
end
