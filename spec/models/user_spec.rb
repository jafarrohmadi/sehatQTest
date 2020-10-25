require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    @user = create(:user).role
    expect(@user == 'patient')
  end

  it "is not valid with email nil" do
    @user = build(:user, email: nil)
    expect(@user).to_not be_valid
  end


  it "is not valid with name nil" do
    @user = build(:user, name: nil)
    expect(@user).to_not be_valid
  end

  describe "Validations" do
    it { should validate_presence_of (:email) }
    it { should validate_length_of (:email) }
    it { should validate_uniqueness_of (:email) }
    it { should validate_length_of (:name) }
  end

end
