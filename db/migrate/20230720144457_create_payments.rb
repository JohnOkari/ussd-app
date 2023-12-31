class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.decimal :amount
      t.string :payment_status
      t.date :payment_date

      t.timestamps
    end
  end
end
