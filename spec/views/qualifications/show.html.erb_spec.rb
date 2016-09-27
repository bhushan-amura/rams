require 'rails_helper'

RSpec.describe "qualifications/show", type: :view do
  before(:each) do
    @qualification = assign(:qualification, Qualification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
