class Doctor < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :phone, :specialization
  before_save :format_phone
  has_many :appointments
  validates :email, :first_name, :gender, :last_name, :phone, :specialization, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
  validates_inclusion_of :gender, :in => %[Male Female], :message => "is not an option", :allow_nil => true, :allow_blank => true
  GENDERS = [['Male'], ['Female']]

  scope :alphabetical, order('last_name, first_name')

	def proper_name
	    first_name+" "+last_name
	end

	def name
	    last_name+", "+first_name
	end

	private

	def format_phone
	    phone = self.phone.to_s
	    phone.gsub!(/[^0-9]/, "")
	    self.phone = phone
	end
end
