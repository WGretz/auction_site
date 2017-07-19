class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.integer :vehicle_year
      t.string :make
      t.string :model
      t.string :stock_no
      t.integer :winning_bid, default: 0
      t.integer :seller_payout, default: 0
      t.text :description
      t.integer :auction_id
      t.integer :batch_upload_id

      t.timestamps
    end
  end
end
