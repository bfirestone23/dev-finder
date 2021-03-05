class CreateUsersJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :users_jobs do |t|
      t.references :user
      t.references :job

      t.timestamps
    end
  end
end
