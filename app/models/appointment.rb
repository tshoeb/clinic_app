class Appointment < ActiveRecord::Base
  attr_accessible :date, :doctor_id, :schedule_id
  validates :date, :doctor_id, :schedule_id, :presence => true
  has_one :schedule
  belongs_to :doctor

  scope :chronological, order('date DESC')
  scope :latest, lambda{|num| limit(num).order('visit_date DESC')}

end
