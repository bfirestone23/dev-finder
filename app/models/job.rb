class Job < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :applications
end
