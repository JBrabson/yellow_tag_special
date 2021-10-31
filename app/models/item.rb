class Item < ApplicationRecord
  validates_presence_of :name, :price
  has_many :discounts
end
