class CreatePricingFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :pricing_features do |t|
      t.string :title
      t.text :desc
      t.string :traits
      t.string :subtext
      t.string :picture

      t.timestamps
    end
  end
end
