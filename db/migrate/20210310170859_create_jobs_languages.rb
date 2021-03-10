class CreateJobsLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_languages do |t|
      t.references :job
      t.references :language
      t.timestamps
    end
  end
end
