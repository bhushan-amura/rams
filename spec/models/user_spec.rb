require 'rails_helper'

RSpec.describe User, type: :model do
  context "when Association" do
    it "has one admin" do
      assc = User.reflect_on_association(:admin)
      expect(assc.macro).to eq :has_one
    end

    it "has one company" do
      assc = User.reflect_on_association(:company)
      expect(assc.macro).to eq :has_one
    end

    it "has one candidate" do
      assc = User.reflect_on_association(:candidate)
      expect(assc.macro).to eq :has_one
    end
  end
end
