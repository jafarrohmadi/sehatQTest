class Doctor < ApplicationRecord
  has_many :doctor_hospitals, foreign_key: 'id_doctor'
  has_many :hospitals, :through => :doctor_hospitals

  has_many :doctor_schedule, :through => :doctor_hospitals
  belongs_to :user, foreign_key: :id_user, primary_key: :id
end
