class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.datetime :transaction_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
