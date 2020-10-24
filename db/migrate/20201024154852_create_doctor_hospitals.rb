class CreateDoctorHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_hospitals do |t|
      t.integer :id_hospital
      t.integer :id_doctor
      t.timestamps
    end
  end
end
