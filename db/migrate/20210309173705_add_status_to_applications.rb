class AddStatusToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :status, :string
  end
end
