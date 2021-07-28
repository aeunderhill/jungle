require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid name, price, quantity and category" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test'

      @product = Product.new
      @product.name = "test-prod"
      @product.price_cents = 10
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test'

      @product = Product.new
      @product.name = nil
      @product.price_cents = 10
      @product.quantity = 100
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test'

      @product = Product.new
      @product.name = 'prod-test'
      @product.quantity = 1
      @product.price_cents = nil
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test'

      @product = Product.new
      @product.name = 'prod-test'
      @product.price_cents = 1
      @product.quantity = nil
      @product.category_id = @category

      @category.products = [@product]

      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @category = Category.new
      @category.id = 6
      @category.name = 'test'

      @product = Product.new
      @product.name = 'prod-test'
      @product.price_cents = 1
      @product.quantity = 1
      @product.category_id = nil

      @category = [@product]

      expect(@product).to_not be_valid
    end
  end
end