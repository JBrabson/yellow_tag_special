require 'rails_helper'

RSpec.describe Receipt, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:transaction_time)}
  end

  describe 'relationships' do
    it {should have_many(:registers)}
    it {should have_many(:items).through(:registers)}
  end

  describe 'instance methods' do
    it 'can apply discounts' do
      receipt = Receipt.create(transaction_time: Time.now)
      milk = Item.create(name: 'Milk', price: 3.97)
      bread = Item.create(name: 'Bread', price: 2.17)
      receipt.scan_item(milk)
      receipt.scan_item(milk)
      receipt.scan_item(bread)
      milk_money = milk.discounts.create(name: 'Milk', qty_required: 2, discounted_price:5.00)
      expect(receipt.discounted_total_by_item(receipt.items)).to eq({'Milk' => 5.00, 'Bread' => 2.17})
    end

    it 'can sort items' do
      receipt = Receipt.create(transaction_time: Time.now)
      milk = Item.create(name: 'Milk', price: 3.97)
      bread = Item.create(name: 'Bread', price: 2.17)
      receipt.scan_item(milk)
      receipt.scan_item(milk)
      receipt.scan_item(bread)
      expect(receipt.sort_items(receipt.items).keys.count).to eq(2)
      expect(receipt.sort_items(receipt.items).keys[0].name).to eq('Milk')
      expect(receipt.sort_items(receipt.items).keys[1].name).to eq('Bread')
    end

    it 'can collect scanned items list' do
      receipt = Receipt.create(transaction_time: Time.now)
      milk = Item.create(name: 'Milk', price: 3.97)
      bread = Item.create(name: 'Bread', price: 2.17)
      receipt.scan_item(milk)
      receipt.scan_item(milk)
      receipt.scan_item(bread)
      expect(receipt.items.count).to eq(3)
      # assert equal list
    end
  end
end
