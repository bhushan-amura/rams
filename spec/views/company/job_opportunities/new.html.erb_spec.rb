require 'rails_helper'

RSpec.describe "company/job_opportunities/new", type: :view do
  before(:each) do
    assign(:company_job_opportunity, Company::JobOpportunity.new())
  end

  it "renders new company_job_opportunity form" do
    render

    assert_select "form[action=?][method=?]", company_job_opportunities_path, "post" do
    end
  end
end
