class Appointment < ActiveRecord::Base
  attr_accessible :date, :doctor_id, :schedule_id
  has_one :schedule
end
