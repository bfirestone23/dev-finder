class RemoveLocationFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :location_id
  end
end
