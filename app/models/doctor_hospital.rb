class DoctorHospital < ApplicationRecord
  belongs_to :doctor , foreign_key: 'id_doctor'
  belongs_to :hospital , foreign_key: 'id_hospital'

  has_many :doctor_schedule , foreign_key: "id_doctor_hospital"
  validates :id_doctor, uniqueness: { scope: :id_hospital }
end
