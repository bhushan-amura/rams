require 'rails_helper'

RSpec.describe "company/events/index", type: :view do
  before(:each) do
    assign(:company_events, [
      Company::Event.create!(),
      Company::Event.create!()
    ])
  end

  it "renders a list of company/events" do
    render
  end
end
