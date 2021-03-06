Discount.destroy_all
Item.destroy_all

@milk = Item.create!(name: 'Milk', price: 3.97)
@bread = Item.create!(name: 'Bread', price: 2.17)
@banana = Item.create!(name: 'Banana', price: 0.99)
@apple = Item.create!(name: 'Apple', price: 0.89)

@milk_money = @milk.discounts.create!(name: 'Milk', qty_required: 2, discounted_price: 5.00)
@bakers_bonanza = @bread.discounts.create!(name: 'Bread', qty_required: 3, discounted_price: 6.00)
