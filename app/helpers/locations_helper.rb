module LocationsHelper

    def job_company_count(location)
        if location.jobs.empty?
            content_tag :p, class: "card-title" do
                "No jobs posted for this location."
            end
        else
            render partial: "locations/job_company_count", locals: { location: location }
        end
    end

    def view_jobs_in_button(location)
        unless location.jobs.empty?
            button_to "View Jobs in #{location.city}", location_jobs_path(location), class: "btn btn-outline-primary float-end", method: :get
        end
    end

    def open_positions_by_location(location)
        if location.jobs.count > 0
            render partial: "locations/open_positions", locals: { location: location }
        end
    end

    def company_companies(location)
        location.users.uniq.count > 1 ? "companies" : "company"
    end

end
