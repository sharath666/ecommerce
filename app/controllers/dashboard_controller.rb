class DashboardController < ApplicationController
  def home
  end

  def categories
    @categories = Category.all
  end

  def products
  @products = Product.all
  end

  def users
    @users = User.all
  end

  def reviews
  end

  def orders
    @orders = Order.all
   @users = User.all
  end
end
