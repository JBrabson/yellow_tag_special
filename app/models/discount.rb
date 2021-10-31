class Discount < ApplicationRecord
  validates_presence_of :qty_required, :discounted_price
  belongs_to :item
end
