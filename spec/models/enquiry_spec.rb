require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it "valid with vaid attributes" do
    
    enquiry = FactoryBot.create(:enquiry)
    expect(enquiry).to be_valid
  end

  it "not valid with invaid attributes" do
    
    enquiry = Enquiry.create(message:"")
    expect(enquiry).to_not be_valid
  end
end
