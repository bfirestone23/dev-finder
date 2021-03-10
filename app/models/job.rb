class Job < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :applications
    has_many :languages, through: :jobs_languages
end
