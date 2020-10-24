class DoctorSchedule < ApplicationRecord
  has_many :appointment, foreign_key: 'id_doctor_schedule'
  belongs_to :doctor_hospital, foreign_key: 'id_doctor_hospital'

  enum day: %i[minggu senin selasa rabu kamis jumat sabtu].freeze
end
