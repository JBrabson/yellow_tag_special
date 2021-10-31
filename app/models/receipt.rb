class Receipt < ApplicationRecord
  validates_presence_of :transaction_time

  has_many  :registers
  has_many  :items, through: :registers

  def discounted_total_by_item(scanned_items)
    # add full price total for savings?
    item_totals = Hash.new
    sorted_items = sort_items(scanned_items)
    discounts = Discount.all
    sorted_items.each do |item|
      discounts.each do |discount|
        # helepr method start
        if item[1] >= discount.qty_required
          item_discount = discount.discounted_price
          item_full_price = item[0][:price]
          apply_discount_times = item[1] / discount.qty_required
          apply_full_price_times = item[1] % discount.qty_required
          discount_total = item_discount * apply_discount_times
          full_price_total = item_full_price * apply_full_price_times
          item_total = discount_total + full_price_total
        else
          item_full_price = item[0][:price]
          apply_full_price_times = item[1] % discount.qty_required
          item_total = item_full_price * apply_full_price_times
        end
          item_totals[item[0][:name]] = item_total
      end
    end
    item_totals
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
