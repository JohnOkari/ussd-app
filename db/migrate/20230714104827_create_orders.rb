class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.string :delivery_address
      t.boolean :payment_status
      t.integer :buyer_id
      t.integer :product_id

      t.timestamps
    end
  end
end
