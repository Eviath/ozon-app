class CreateInformationTiles < ActiveRecord::Migration[6.0]
  def change
    create_table :information_tiles do |t|
      t.text :desc
      t.string :picture

      t.timestamps
    end
  end
end
