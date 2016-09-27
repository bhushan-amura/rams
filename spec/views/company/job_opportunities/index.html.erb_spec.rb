require 'rails_helper'

RSpec.describe "company/job_opportunities/index", type: :view do
  before(:each) do
    assign(:company_job_opportunities, [
      Company::JobOpportunity.create!(),
      Company::JobOpportunity.create!()
    ])
  end

  it "renders a list of company/job_opportunities" do
    render
  end
end
