class CreateInformationBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :information_blocks do |t|
      t.string :title
      t.text :desc
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
