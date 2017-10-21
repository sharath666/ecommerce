class AjaxCallsController < ApplicationController
	def check_email_taken
		if params[:email]
			@user = User.find_by(email: params[:email])
		end
		if @user.nil?
			render json: {user_taken: false}
		else
			render json: {user_taken: true}
		end
	end
	def find_sub_categories
		@category = Category.find(params[:category_id])
		render json: @category.subcategories
	end
end

