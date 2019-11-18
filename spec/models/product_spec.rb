require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # subject { described_class.new}
    # cat1 = Category.find_or_create_by! name: 'Food'

    it "successfully validates and adds a product to the database, provided it has all the requisite fields" do
      @category = Category.create(name: "Food")
      @product = Product.create(name: "Toasted Bread", price_cents: 5000, quantity: 1, category_id: 1)
      expect(@product).to be_valid
    end

    it "validates the name before adding a product to the database" do
      @category = Category.create(name: "Food")
      @product = Product.create(name: "Toasted Bread", price_cents: nil, quantity: nil, category_id: nil)
      expect(@product.errors.full_messages).not_to include("Name can't be blank")
    end

    it "validates price before adding a product to the database" do
      @category = Category.create(name: "Food")
      @product = Product.create(name: nil, price_cents: 5000, quantity: nil, category_id: nil)
      expect(@product.errors.full_messages).not_to include("Price can't be blank")
    end

    it "validates quantity before adding a product to the database" do
      @category = Category.create(name: "Food")
      @product = Product.create(name: nil, price_cents: nil, quantity: 1, category_id: nil)
      expect(@product.errors.full_messages).not_to include("Quantity can't be blank")
    end

    it "validates the category before adding a product to the database" do
      @category = Category.create(name: "Food")
      @product = Product.create(name: nil, price_cents: nil, quantity: nil, category_id: 1)
      expect(@product.errors.full_messages).not_to include("Category can't be blank")
    end
  end
end
