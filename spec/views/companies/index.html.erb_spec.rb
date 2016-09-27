require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(),
      Company.create!()
    ])
  end

  it "renders a list of companies" do
    render
  end
end
