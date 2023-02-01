class AddMeasurementUnitIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :measurement_unit_id, :integer
  end
end
