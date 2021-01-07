class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :desc
      t.string :picture
      t.timestamps
    end
  end
end
