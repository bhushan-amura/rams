require 'rails_helper'

RSpec.describe "qualifications/edit", type: :view do
  before(:each) do
    @qualification = assign(:qualification, Qualification.create!())
  end

  it "renders the edit qualification form" do
    render

    assert_select "form[action=?][method=?]", qualification_path(@qualification), "post" do
    end
  end
end
