class CreateBuyerRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_requests do |t|
      t.references :buyer, null: false, foreign_key: true
      t.string :product
      t.integer :quantity
      t.text :other_details

      t.timestamps
    end
  end
end
