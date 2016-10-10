require 'rails_helper'

RSpec.describe Admin, type: :model do
	context "when Association" do
		it "belongs_to user" do
      assc = Admin.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
	end
end
