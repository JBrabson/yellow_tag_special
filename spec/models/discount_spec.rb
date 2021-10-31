require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:qty_required)}
    it {should validate_presence_of(:discounted_price)}
  end

  describe 'relationships' do
    it {should belong_to(:item)}
  end

  describe 'instance methods' do
    it 'should add discount to item' do
      milk = Item.create(name: 'Milk', price: 3.97)
      expect(milk.discounts).to eq([])

      milk_money = milk.discounts.create(name: 'Milk', qty_required: 2, discounted_price:5.00)
      expect(milk.discounts.count).to eq(1)
      expect(milk.discounts[0].qty_required).to eq(2)
      expect(milk.discounts[0].discounted_price).to eq(5.0)
      expect(Discount.all.count).to eq(1)
    end
  end
end
