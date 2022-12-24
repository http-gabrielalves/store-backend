class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image
      t.text :description
      t.string :category
      t.string :unit
      t.integer :stocked
      t.float :price

      t.timestamps
    end
  end
end
