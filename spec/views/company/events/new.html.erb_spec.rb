require 'rails_helper'

RSpec.describe "company/events/new", type: :view do
  before(:each) do
    assign(:company_event, Company::Event.new())
  end

  it "renders new company_event form" do
    render

    assert_select "form[action=?][method=?]", company_events_path, "post" do
    end
  end
end
