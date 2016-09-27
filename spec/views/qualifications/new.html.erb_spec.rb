require 'rails_helper'

RSpec.describe "qualifications/new", type: :view do
  before(:each) do
    assign(:qualification, Qualification.new())
  end

  it "renders new qualification form" do
    render

    assert_select "form[action=?][method=?]", qualifications_path, "post" do
    end
  end
end
