class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :time_slot
      t.boolean :available
      t.integer :appointment_id

      t.timestamps
    end
  end
end
