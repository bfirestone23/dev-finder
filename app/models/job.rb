class Job < ApplicationRecord
    belongs_to :location
    has_many :users_jobs
    has_many :users, through: :users_jobs
end
