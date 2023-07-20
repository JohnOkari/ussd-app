class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :order, null: false, foreign_key: true
      t.string :status
      t.date :delivery_date
      t.string :delivery_address

      t.timestamps
    end
  end
end
