require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
12.times do |i|
  #user login with email and role patients
  User.create(name: Faker::Name.unique.name, email: "patients#{i}@gmail.com", password: 'password')
end

2.times do
  @hospital = Hospital.create(name: Faker::Company.name, address: Faker::Address.full_address)
end

10.times do |i|
  #user login with email and role doctor
  @user = User.create(name: Faker::Name.unique.name, email: "doctor#{i}@gmail.com", password: 'password', role: 1)
  @doctor = Doctor.create(id_user: @user.id, specialis: 'Child', graduates: Faker::University.name)

  #user login with provider and role patients
  User.create(name: Faker::Name.unique.name, email: "socmed#{i}@gmail.com", password: 'password', provider_type: 'facebook', provider_id: Faker::Number.number(digits: 10))

end

20.times do |i|
  @doctor_hospital = DoctorHospital.create(id_hospital: rand(1...3), id_doctor: rand(1...10))

  5.times do |i|
    if(@doctor_hospital.id != nil)
      DoctorSchedule.create(id_doctor_hospital: @doctor_hospital.id, day: i + 1, start_at: '08:00:00', end_at: '16:00:00')
    end
  end
end

#user login with email and role admin
User.create(name: Faker::Name.unique.name, email: 'admin@gmail.com', password: 'password', role: 0)

12.times do |i|
  rand(9...10).times do |j|
    Appointment.create(id_doctor_schedule: j+1, id_user: i + 1, start_at: "09:00:00", end_at: "10:00:00")
  end
end