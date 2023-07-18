class CreateFarmerResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :farmer_responses do |t|
      t.references :farmer, null: false, foreign_key: true
      t.references :buyer_request, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
