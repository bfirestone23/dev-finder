class RemovePayFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :pay
  end
end
