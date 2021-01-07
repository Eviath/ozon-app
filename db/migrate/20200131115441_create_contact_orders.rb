class CreateContactOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_orders do |t|
      t.string :name
      t.text :message
      t.string :email

      t.timestamps
    end
  end
end
