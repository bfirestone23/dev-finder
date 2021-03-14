module LocationsHelper

    def job_company_count(location)
        if location.jobs.empty?
            render "locations/no_results"
        else
            render partial: "locations/job_company_count", locals: { location: location }
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
