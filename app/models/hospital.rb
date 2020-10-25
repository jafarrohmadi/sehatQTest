class Hospital < ApplicationRecord
  has_many :doctor_hospitals, foreign_key: 'id_hospital'
  has_many :doctors, :through => :doctor_hospitals

  validates :name, uniqueness: true, length: {minimum: 1}
  validates :address, length: {minimum: 10}
end
