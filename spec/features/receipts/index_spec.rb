require 'rails_helper'

describe "Receipts Index page" do

  it "displays weekly items and pricing table" do
    milk = Item.create(name: 'Milk', price: 3.97)
    bread = Item.create(name: 'Bread', price: 2.17)
    banana = Item.create(name: 'Banana', price: 0.99)
    apple = Item.create(name: 'Apple', price: 0.89)
    milk_money = milk.discounts.create(name: 'Milk', qty_required: 2, discounted_price: 5.00)
    bakers_bonanza = bread.discounts.create(name: 'Bread', qty_required: 3, discounted_price: 6.00)
    gone_bananas = banana.discounts.create(name: 'Banana', qty_required: 2, discounted_price: 0.50)
    visit '/receipts'

    items = milk, bread, banana, apple
    items.each do |item|
      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price)
      if item.discounts
        expect(page).to have_content(item.discounts[1])
        expect(page).to have_content(item.discounts[2])
      end
    end
  end
end
