class RemoveCreatedFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :created, :datetime
  end
end
