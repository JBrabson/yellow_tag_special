class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.references :item, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
