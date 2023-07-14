class CreateFarmers < ActiveRecord::Migration[7.0]
  def change
    create_table :farmers do |t|
      t.string :location
      t.string :contact_infomation

      t.timestamps
    end
  end
end
