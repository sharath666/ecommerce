class CartLineItemsController < ApplicationController
	
	before_action :authenticate_user!
	def index
	@cart_line_items= current_user.cart_line_items
	@order = Order.new

	end
	def create
		#define the action create for cartlineitems in show page
		@cart_line_item = CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))
		#creates a new object of cartlineitems and we are passing the paramters to the newly created object .permit gives that these parameters will go and save into the database 
		@cart_line_item.user_id = current_user.id



		if @cart_line_item.save_or_update
			redirect_to cart_line_items_path, notice: "succesfully added product to cart"
		end
	end

	def update
		@cart_line_item = CartLineItem.find(params[:id])
		if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))
			redirect_to cart_line_items_path, notice: "succesfully upadated your quantity"
		end
	end
def destroy
	@cart_line_item = CartLineItem.find(params[:id])
	@cart_line_item.destroy
	redirect_to cart_line_items_path, notice: "succesfully removed the product"
end

end
