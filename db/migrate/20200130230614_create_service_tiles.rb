class CreateServiceTiles < ActiveRecord::Migration[6.0]
  def change
    create_table :service_tiles do |t|
      t.string :title
      t.text :desc
      t.string :picture

      t.timestamps
    end
  end
end
