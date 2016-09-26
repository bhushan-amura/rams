require 'rails_helper'

RSpec.describe "candidate/links/new", type: :view do
  before(:each) do
    assign(:candidate_link, Candidate::Link.new())
  end

  it "renders new candidate_link form" do
    render

    assert_select "form[action=?][method=?]", candidate_links_path, "post" do
    end
  end
end
