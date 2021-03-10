class DropUsersJobs < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_jobs
  end
end
