module UsersHelper

    def user_location_count(user)
        if user.jobs.empty?
            content_tag :p, class: "card-title" do
                "No jobs posted for this employer."
            end
        else
            render partial: "devise/users/job_locations_count", locals: { user: user }
        end
    end

    def open_positions_by_user(user)
        if user.jobs.count > 0
            render partial: "devise/users/open_positions", locals: { user: user }
        end
    end

    def view_jobs_button(user)
        unless user.jobs.empty?
            button_to "View Jobs", user_path(user), class: "btn btn-outline-primary float-end", method: :get
        end
    end

    def location_locations(user)
        user.locations.uniq.count > 1 ? "locations" : "location"
    end

    def user_controls(job)
        if current_user == job.user 
            render partial: "jobs/controls/employer_controls", locals: { job: job }
        else
            link_to "Apply to #{job.title}", new_job_application_path(job), class: "btn btn-outline-primary"
        end
    end

    def user_detail
        if current_user
            render "user_details"
        end
    end

end