class Receipt < ApplicationRecord
  validates_presence_of :transaction_time, :items_purchased
  has_many  :registers
  has_many  :items, through: :registers

  def totals(scanned_items)
    discounts = Discount.all
    purchased_items = sort_items(scanned_items)
    items_stats = Hash.new
    items = Item.all

    purchased_items.each do |item|
      name = item[0]
      qty = item[1]
      discount = discounts.where(name: name)
      item_info = items.where(name: item[0])

      if discount.empty? || qty < discount[0][:qty_required]
        total = qty * item_info[0][:price]
        items_stats[name] = {transaction_total: total, without_disc: total, item_savings: 0, qty: qty}
      else discount && qty >= discount[0][:qty_required]
        discounted_total = (qty / discount[0][:qty_required]) * discount[0][:discounted_price]
        full_price_total = (qty % discount[0][:qty_required]) * item_info[0][:price]
        total = discounted_total + full_price_total
        items_stats[name] = {transaction_total: total, without_disc: (item_info[0][:price] * qty).round(2), item_savings: (item_info[0][:price] * item[1] - total).round(2), qty: item[1]}
      end
    end
    items_stats
  end

  def sort_items(items_string)
    items = items_string.split(',')
    items = items.collect(&:strip)
    count = {}
    items.map do |item|
      if count[item.capitalize]
        then count[item.capitalize] += 1
      else
        count[item.capitalize] = 1
      end
    end
    count
  end
end
