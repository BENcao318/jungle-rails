require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "should save with a valid product" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: "Pineapple",
        price: 34.00,
        quantity: 15,
        category_id: @category.id
      )
      expect(product).to be_valid
    end

    it "should not save without a valid name" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: nil,
        price: 34.00,
        quantity: 15,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should not save without valid price" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: "Cat Socks",
        price: '',
        quantity: 15,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should not save without valid quantity" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: "Hot Dog",
        price: 34.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(product).to_not be_valid
    end

    it "should not save without valid category id" do
      @category = Category.create(name: "Food")
      product = Product.new(
        name: "Cheese bar",
        price: 34.00,
        quantity: 15,
        category_id: nil
      )
      expect(product).to_not be_valid
    end
  end
end
