class AddDefaultToApplicationStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :applications, :status, "Pending"
  end
end
