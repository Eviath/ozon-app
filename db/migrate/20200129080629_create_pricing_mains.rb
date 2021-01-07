class CreatePricingMains < ActiveRecord::Migration[6.0]
  def change
    create_table :pricing_mains do |t|
      t.string :title
      t.string :price
      t.integer :position, default: 0
      t.string :picture

      t.timestamps
    end
  end
end
