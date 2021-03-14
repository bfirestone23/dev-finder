module ApplicationsHelper

    def employer_controls(application)
        if application.job.user == current_user
            if application.status == "Pending"
                render "applications/employer_controls", application: application
            else
                "Your response has been submitted to the applicant!"
            end
        end
    end

end