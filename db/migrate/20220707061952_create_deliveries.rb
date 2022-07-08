class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :address_region_id,  null: false
      t.string :address_city,        null: false
      t.string :address_street,      null: false
      t.string :address_building
      t.string :postcode,            null: false
      t.string :phone_number,        null: false
      t.references :order,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
