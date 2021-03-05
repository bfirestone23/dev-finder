class AddEmployerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :employer, :boolean
  end
end
