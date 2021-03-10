class CreateUsersLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :users_languages do |t|
      t.references :user
      t.references :language
      t.timestamps
    end
  end
end
