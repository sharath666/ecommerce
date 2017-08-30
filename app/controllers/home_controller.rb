class HomeController < ApplicationController
  def index
  	@categories = Category.all
  	@products = Product.all
  end
  def about
  end
  def contact
  end
end
