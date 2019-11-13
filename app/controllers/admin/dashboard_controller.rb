class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
    puts @products.count
    puts @products.distinct.count('category_id')
  end
end
