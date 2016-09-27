require 'rails_helper'

RSpec.describe "candidate/links/edit", type: :view do
  before(:each) do
    @candidate_link = assign(:candidate_link, Candidate::Link.create!())
  end

  it "renders the edit candidate_link form" do
    render

    assert_select "form[action=?][method=?]", candidate_link_path(@candidate_link), "post" do
    end
  end
end
