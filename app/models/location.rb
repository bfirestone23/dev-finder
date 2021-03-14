class Location < ApplicationRecord
    has_many :jobs
    has_many :users, through: :jobs

    validates :city, presence: true, uniqueness: true
end
