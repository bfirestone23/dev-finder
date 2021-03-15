module JobsHelper

    def post_job_button(location=nil)
        if current_user.employer && location
             render "jobs/controls/post_job_by_location", location: location
        end
    end

    def job_titles_by(object)
        object.jobs.map {|j| j.title }.join(", ")
    end

end
