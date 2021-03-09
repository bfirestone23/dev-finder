class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :previous_job
      t.text :previous_experience
      t.integer :years_experience
      t.text :cover_letter
      t.date :date_available
      t.references :user
      t.references :job
      t.timestamps
    end
  end
end
