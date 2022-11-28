require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    User.destroy_all
    @user = create(:user)
  end

  it "is using valid attributes by default" do
    expect(@user).to be_valid
  end

  it "username should be present" do
    user = build(:user, email: "abc@def.com", username: nil)
    expect(user).to_not be_valid
  end

  it "has a unique username" do
    user = build(:user, email: "hello@example.com")
    expect(user).to_not be_valid
  end
  
  it "has a unique email address" do
    user = build(:user, username: "david")
    expect(user).to_not be_valid
  end
  
  it "is not valid unless email is present" do
    user = build(:user, username: "noemail", email: nil)
    expect(user).to_not be_valid
  end
  
  it "is not valid unless password is present" do 
    user = build(:user, username: "nopassword", email: "test@example.com", password: nil)
    expect(user).to_not be_valid
  end
end
