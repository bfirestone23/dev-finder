module JobsHelper

    def user_controls(job)
        if current_user == job.user 
            render partial: "jobs/controls/employer_controls", locals: { job: job }
        else
            render partial: "jobs/controls/applicant_controls", locals: { job: job }
        end
    end

    def post_job_button(location=nil)
        if current_user.employer && location
             render partial: "jobs/controls/post_job_by_location", locals: { location: location }
        end
    end
end
