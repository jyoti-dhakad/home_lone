require 'rails_helper'

RSpec.describe LoanApplication, type: :model do
  it "valid with vaid attributes" do
    
    loan = FactoryBot.create(:loan_application)
    expect(loan).to be_valid
  end

  it "not valid with invaid attributes" do
    
    loan = LoanApplication.create(year:"")
    expect(loan).to_not be_valid
  end
end
