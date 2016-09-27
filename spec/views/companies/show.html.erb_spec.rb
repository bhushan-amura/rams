require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
