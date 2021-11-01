class AddItemsToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column  :receipts, :items_purchased, :string
  end
end
