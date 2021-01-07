class AddHeaderColumnToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :header, :text
  end
end
