class WishlistsController < ApplicationController

		def index 
		@wishlists = Wishlist.all
		end

def create
@wishlist = Wishlist.new(params[:wishlist].permit(:user_id, :product_id, :quantity))
		@wishlist.user_id = current_user.id
		if @wishlist.save
		redirect_to wishlists_path, notice: "successfully added to wishlist" 
	end

end


end
