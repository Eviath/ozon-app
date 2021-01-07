class CreateContactBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_blocks do |t|
      t.string :title
      t.text :desc
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
