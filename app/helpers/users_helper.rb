module UsersHelper

    def user_location_count(user)
        if user.jobs.empty?
            render "devise/users/no_results"
        else
            render partial: "devise/users/job_locations_count", locals: { user: user }
        end
    end

    def open_positions_by_user(user)
        if user.jobs.count > 0
            render partial: "devise/users/open_positions", locals: { user: user }
        end
    end

    def location_locations(user)
        user.locations.uniq.count > 1 ? "locations" : "location"
    end

    def user_controls(job)
        if current_user == job.user 
            render partial: "jobs/controls/employer_controls", locals: { job: job }
        else
            render partial: "jobs/controls/applicant_controls", locals: { job: job }
        end
    end

    def user_detail
        if current_user
            render "user_details"
        end
    end

end