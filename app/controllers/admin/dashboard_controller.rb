class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['username'], :password => ENV['password']
  def show
    @products = Product.order(id: :desc).all
    puts @products.count
    puts @products.distinct.count('category_id')
  end
end
