class Register < ApplicationRecord
  belongs_to :item
  belongs_to :receipt
end
