require 'rails_helper'

RSpec.describe "company/events/show", type: :view do
  before(:each) do
    @company_event = assign(:company_event, Company::Event.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
