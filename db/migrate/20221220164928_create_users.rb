class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :created
      t.string :address
      t.string :picture

      t.timestamps
    end
  end
end
