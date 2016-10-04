require 'rails_helper'

RSpec.describe "qualifications/index", type: :view do
  before(:each) do
    assign(:qualifications, [
      Qualification.create!(),
      Qualification.create!()
    ])
  end

  it "renders a list of qualifications" do
    render
  end
end
