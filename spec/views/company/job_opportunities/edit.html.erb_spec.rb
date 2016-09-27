require 'rails_helper'

RSpec.describe "company/job_opportunities/edit", type: :view do
  before(:each) do
    @company_job_opportunity = assign(:company_job_opportunity, Company::JobOpportunity.create!())
  end

  it "renders the edit company_job_opportunity form" do
    render

    assert_select "form[action=?][method=?]", company_job_opportunity_path(@company_job_opportunity), "post" do
    end
  end
end
