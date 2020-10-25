require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe "Associations" do
    it { should have_many(:doctor_hospitals) }
    it { should have_many(:hospitals).through(:doctor_hospitals) }
    it { should have_many(:doctor_schedule).through(:doctor_hospitals) }
    it { should belong_to(:user) }
  end

  describe "Validations" do
    it { should validate_uniqueness_of (:id_user) }
    it { should validate_length_of (:id_user) }
    it { should validate_length_of (:specialis) }
    it { should validate_length_of (:graduates) }
  end
end
