require 'rails_helper'

RSpec.describe Achievement, type: :model do
	 it { should belong_to(:candidate) }
end
