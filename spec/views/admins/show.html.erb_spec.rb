require 'rails_helper'

RSpec.describe "admins/show", type: :view do
  before(:each) do
    @admin = assign(:admin, Admin.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
