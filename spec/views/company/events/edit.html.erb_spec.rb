require 'rails_helper'

RSpec.describe "company/events/edit", type: :view do
  before(:each) do
    @company_event = assign(:company_event, Company::Event.create!())
  end

  it "renders the edit company_event form" do
    render

    assert_select "form[action=?][method=?]", company_event_path(@company_event), "post" do
    end
  end
end
