class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :id_doctor_schedule
      t.integer :id_user
      t.time :start_at
      t.time :end_at
      t.timestamps
    end
  end
end
