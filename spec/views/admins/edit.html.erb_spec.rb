require 'rails_helper'

RSpec.describe "admins/edit", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!())
  end

  it "renders the edit admin form" do
    render

    assert_select "form[action=?][method=?]", admin_path(@admin), "post" do
    end
  end
end
