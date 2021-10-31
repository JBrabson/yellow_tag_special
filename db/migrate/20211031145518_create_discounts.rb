class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :qty_required
      t.float :discounted_price
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
