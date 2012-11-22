class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.date :date
      t.integer :time_id

      t.timestamps
    end
  end
end
