class Application < ApplicationRecord
    belongs_to :user
    belongs_to :job

    validates_presence_of :previous_experience, 
    :previous_job, 
    :years_experience, 
    :cover_letter, 
    :date_available

end