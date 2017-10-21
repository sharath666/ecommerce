class ReviewsController < ApplicationController
	def index
		@reviews = Reviews.all
		@product_reviews = Review.where('product_id=?', @review.product_id)
	end
	
	def create
		@review = Review.new(params[:review].permit(:product_id,:user_id,:body, :rating))
		@review.user_id = current_user.id
		respond_to do |format|
		if @review.save
			format.html { redirect_to :back, notice: 'review was successfully created.' }
			format.js
			
		else
			format.js
		
		end
	end
	end	
	def edit
		@review = Review.find(params[:id])
	end
	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(params[:review].permit(:product_id,:user_id,:body, :rating))
			redirect_to product_path(@review.product_id)
		else
			render action: "edit"
		end
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to product_path(@review.product_id), notice: "review is deleted"
	end
end
