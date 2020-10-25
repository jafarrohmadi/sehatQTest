require 'rails_helper'

RSpec.describe Hospital, type: :model do

  it "is valid with valid attributes" do
    create(:hospital)
  end

  it "is not valid with name nil" do
    $hospital = build(:hospital, address: nil)
    expect($hospital).to_not be_valid
  end

  describe "Associations" do
    it { should have_many(:doctor_hospitals) }
    it { should have_many(:doctors).through(:doctor_hospitals) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of (:name) }
    it { should validate_length_of (:name) }
    it { should validate_length_of (:address) }
  end

end
