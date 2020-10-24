class CreateDoctorSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_schedules do |t|
      t.integer :id_doctor_hospital
      t.integer :day
      t.time :start_at
      t.time :end_at
      t.timestamps
    end
  end
end
