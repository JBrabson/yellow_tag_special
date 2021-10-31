class Receipt < ApplicationRecord
  validates_presence_of :transaction_time

  has_many  :registers
  has_many  :items, through: :registers
end
