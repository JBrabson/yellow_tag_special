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
      banana = Item.create(name: 'Banana', price: 0.99)
      apple = Item.create(name: 'Apple', price: 0.89)
      receipt = Receipt.create(transaction_time: Time.now, items_purchased: 'milk,milk,bread,bread,bread,bread,apple,banana')
      milk_money = milk.discounts.create(name: 'Milk', qty_required: 2, discounted_price: 5.00)
      bakers_bonanza = bread.discounts.create(name: 'Bread', qty_required: 3, discounted_price: 6.00)
      gone_bananas = banana.discounts.create(name: 'Banana', qty_required: 2, discounted_price: 0.50)
      result = {
        "Apple"=>{:transaction_total=> 0.89, :without_disc=>0.89, :item_savings=>0, :qty=>1},
        "Milk"=>{:transaction_total=>5.0, :without_disc=>7.94, :item_savings=>2.94, :qty=>2},
        "Bread"=>{:transaction_total=>8.17, :without_disc=>8.68, :item_savings=>0.51, :qty=>4},
        "Banana"=>{:transaction_total=>0.99, :without_disc=>0.99, :item_savings=>0, :qty=>1}
      }
      expect(receipt.totals(receipt[:items_purchased])).to eq(result)
    end

    it 'can sort items' do
      milk = Item.create(name: 'Milk', price: 3.97)
      bread = Item.create(name: 'Bread', price: 2.17)
      receipt = Receipt.create(transaction_time: Time.now, items_purchased: 'milk,milk,bread')
      expect(receipt.sort_items(receipt[:items_purchased]).keys.count).to eq(2)
      expect(receipt.sort_items(receipt[:items_purchased]).keys[0]).to eq('Milk')
      expect(receipt.sort_items(receipt[:items_purchased]).keys[1]).to eq('Bread')
    end

    it 'can collect scanned items list' do
      receipt = Receipt.create(transaction_time: Time.now)
      milk = Item.create(name: 'Milk', price: 3.97)
      bread = Item.create(name: 'Bread', price: 2.17)
      receipt = Receipt.create(transaction_time: Time.now, items_purchased: 'milk,milk,bread')
      expect(receipt[:items_purchased].split(',').count).to eq(3)
    end
  end
end
