class Discount < ApplicationRecord
  validates_presence_of :name, :qty_required, :discounted_price
  belongs_to :item
end
