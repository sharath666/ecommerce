class OrdersController < ApplicationController
	def index
		#Order.where('user_id =?').current_user.id
		@orders= current_user.orders
	end

 def create
	@order = Order.new(order_date: Date.today, order_number: "AE#{Random.rand(100)}")

	@order.user_id = current_user.id
 		@order.save
 		#Notification.order_confirmation(@order).deliver!
 		redirect_to orders_path, notice: "successfully order placed"
 end

end
