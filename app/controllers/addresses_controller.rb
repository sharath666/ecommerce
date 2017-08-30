class AddressesController < ApplicationController
def index
	@addresses = Address.all 
end

def new
	@address = Address.new
end


	def create

		@address = Address.new(params[:address].permit(:street, :pin, :city, :landmark))
		 @address.user_id  = current_user.id 
		if @address.save
			redirect_to products_path, notice: "successfully created the address"
		else
			render action: "new"
		end
	end
end
