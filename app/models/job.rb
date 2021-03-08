class Job < ApplicationRecord
    belongs_to :location
    has_many :users_jobs
    has_many :users, through: :users_jobs

    accepts_nested_attributes_for :users 
    accepts_nested_attributes_for :location
end
