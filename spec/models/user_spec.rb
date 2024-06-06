require 'rails_helper'

RSpec.describe User, type: :model do
  it "valid with vaid attributes" do
    
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "not valid with invaid attributes" do
    
    user = User.create(name:"juido")
    expect(user).to_not be_valid
  end
end
