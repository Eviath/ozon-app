class CreatePricingBenefits < ActiveRecord::Migration[6.0]
  def change
    create_table :pricing_benefits do |t|
      t.string :title
      t.string :traits
      t.string :picture

      t.timestamps
    end
  end
end
