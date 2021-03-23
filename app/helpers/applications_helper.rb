module ApplicationsHelper

    def employer_controls(application)
        if application.job.user == current_user
            if application.status == "Pending"
                render "applications/employer_controls", application: application
            else
                content_tag :p, class: "lead" do 
                    "Your response has been submitted to the applicant!"
                end
            end
        end
    end

    def view_application_button(application)
        if application.job 
            button_to "View Application", job_application_path(application.job, application), class: "btn btn-outline-primary float-end", method: :get
        else
            content_tag :p, class: "float-end" do 
                "This job is no longer available."
            end
        end
    end

end