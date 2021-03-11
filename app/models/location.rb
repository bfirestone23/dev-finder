class Location < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs
end
