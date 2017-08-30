class Address < ActiveRecord::Base
	belongs_to :order
	validates_presence_of :user_id, :street, :pin, :city, :landmark
	validates_numericality_of :user_id, :pin
	validates :pin, length: { maximum: 6 }
end
