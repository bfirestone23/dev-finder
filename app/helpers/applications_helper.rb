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

    # def render_applications(applications)
    #     if applications.empty?
    #         content_tag :p do
    #             "No applications yet - check back later."
    #         end
    #     else
    #         render partial: "card_index", collection: applications 
    #     end
    # end

end