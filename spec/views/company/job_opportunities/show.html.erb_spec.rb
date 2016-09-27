require 'rails_helper'

RSpec.describe "company/job_opportunities/show", type: :view do
  before(:each) do
    @company_job_opportunity = assign(:company_job_opportunity, Company::JobOpportunity.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
