require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  before(:each) do
    @candidate = FactoryGirl.build(:candidate)
  end

  before(:each) do
    @company = FactoryGirl.build(:company)
  end

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

  describe User, 'methods' do
    describe "when find role is" do
      context "candidate" do
        it "should return candidate role" do
          user = @user
          user.role = 'candidate'
          user.save!
          user.should be_valid
          expect(user.is? :candidate).to eql(true)
        end  
      end
      context "company" do 
        it "should return company role" do
          user = @user 
          user.role = 'company'
          user.save!
          user.should be_valid
          expect(user.is? :company).to eql(true)
        end
      end
      context "admin" do
        it "should return admin role" do
          user = @user
          user.role = "admin"
          user.save!
          user.should be_valid
          expect(user.is? :admin).to eql(true)
        end
      end
    end

    describe "when info user" do
      it "should return candidate object" do
        candidate = @candidate
        candidate.should be_valid
        candidate.save!
        expect(candidate.user.info).to be_a_kind_of(Candidate)    
      end
      it "should return company object" do
        company = @company
        company.should be_valid
        company.save!
        expect(company.user.info).to be_a_kind_of(Company)    
      end
    end

  end
end