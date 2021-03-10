class Language < ApplicationRecord
    has_many :users, through: :users_languages
    has_many :jobs, through: :jobs_languages
end
