module UsersHelper

    def facebook_image
        if current_user && current_user.provider == "facebook"
            image_tag(current_user.image, class: "rounded-circle", id: "fb_img") if current_user && current_user.provider == "facebook"
        end
    end

    def user_location_count(user)
        if user.jobs.empty?
            content_tag :p, class: "card-title" do
                "No jobs posted for this employer."
            end
        else
            render "devise/users/job_locations_count", user: user
        end
    end

    def open_positions_by_user(user)
        if user.jobs.count > 0
            render "devise/users/open_positions", user: user
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
        if current_user != job.user && !current_user.employer
            link_to "Apply to #{job.title}", new_job_application_path(job), class: "btn btn-outline-primary"
        elsif current_user == job.user 
            render "jobs/controls/employer_controls", job: job
        end
    end

    def user_detail
        if current_user
            render "user_details"
        end
    end

end