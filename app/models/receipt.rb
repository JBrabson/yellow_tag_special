class Receipt < ApplicationRecord
  validates_presence_of :transaction_time

  has_many  :registers
  has_many  :items, through: :registers

  def totals(scanned_items)
    discounts = Discount.all
    purchased_items = sort_items(scanned_items)
    items_stats = Hash.new
    purchased_items.each do |item|
      name = item[0][:name]
      discount = discounts.where(name: name)
      if discount == [] || item[1] < discount[0][:qty_required]
        total = item[1] * item[0][:price]
        items_stats[item[0][:name]] = {transaction_total: total, without_disc: total, item_savings: 0}
      else discount && item[1] >= discount[0][:qty_required]
        discounted_total = (item[1] / discount[0][:qty_required]) * discount[0][:discounted_price]
        full_price_total = (item[1] % discount[0][:qty_required]) * item[0][:price]
        total = discounted_total + full_price_total
        items_stats[name] = {transaction_total: total, without_disc: (item[0][:price] * item[1]).round(2), item_savings: (item[0][:price] * item[1] - total).round(2)}
      end
    end
    items_stats
    # add full price total for savings?
    # item_totals = Hash.new
    # sorted_items = sort_items(scanned_items)
    # discounts = Discount.all
    # discounts.each do |discount|
    #   sorted_items.each do |item|
        # helepr method start
    #     if item[1] >= discount.qty_required
    #       item_discount = discount.discounted_price
    #       item_full_price = item[0][:price]
    #       apply_discount_times = item[1] / discount.qty_required
    #       apply_full_price_times = item[1] % discount.qty_required
    #       discount_total = item_discount * apply_discount_times
    #       full_price_total = item_full_price * apply_full_price_times
    #       item_total = discount_total + full_price_total
    #       item_totals[item[0][:name]] = item_total
    #     else
    #       item_full_price = item[0][:price]
    #       apply_full_price_times = item[1]
    #       item_total = item_full_price * apply_full_price_times
    #       item_totals[item[0][:name]] = item_total
    #     end
    #   end
    # end
    # item_totals
  end

  def sort_items(items)
    count = {}
    items.map do |item|
      if count[item]
        then count[item] += 1
      else
        count[item] = 1
      end
    end
    count
  end

  def scan_item(item)
    items << item
  end
end
