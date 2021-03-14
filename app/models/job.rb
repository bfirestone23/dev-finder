class Job < ApplicationRecord
    belongs_to :location
    belongs_to :user
    has_many :applications

    validates_presence_of :title, :description
end
