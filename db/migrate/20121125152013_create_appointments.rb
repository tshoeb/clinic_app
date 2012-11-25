class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.date :date
      t.integer :schedule_id

      t.timestamps
    end
  end
end
