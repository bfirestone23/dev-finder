class JobsLanguage < ApplicationRecord
    belongs_to :job
    belongs_to :language
end
