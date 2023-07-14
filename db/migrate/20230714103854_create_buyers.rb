class CreateBuyers < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :location
      t.integer :farmer_id

      t.timestamps
    end
  end
end
