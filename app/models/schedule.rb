class Schedule < ActiveRecord::Base
  attr_accessible :appointment_id, :available, :time_slot
  belongs_to :appointment
  validates :appointment_id, :time_slot, :presence => true
  validates_inclusion_of :time_slot, :in => %[8 am - 9 am, 9 am - 10 am, 10 am - 11 am, 11 am - 12 pm, 12 pm - 1 pm], :message => "is not an option", :allow_nil => true, :allow_blank => true
  SLOTS = [['8 am - 9 am'], ['9 am - 10 am'], ['10 am - 11 am'], ['11 am - 12 pm'], ['12 pm - 1 pm']]
  scope :available, where('available = ?', true)
end
