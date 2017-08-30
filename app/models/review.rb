class Review < ActiveRecord::Base
	belongs_to :product
	validates_presence_of :product_id, :user_id, :body, :rating
	validates_numericality_of :product_id, :user_id

end
