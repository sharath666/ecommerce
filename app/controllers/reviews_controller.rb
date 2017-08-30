class ReviewsController < ApplicationController
	def index
		@review = Reviews.all
	end
	
	def create
		@review = Review.new(params[:review].permit(:product_id,:user_id,:body, :rating))
		@review.user_id = current_user.id
		if @review.save
			redirect_to products_path, notice: "successfully added review"
		else
			render action: "new"
		
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
