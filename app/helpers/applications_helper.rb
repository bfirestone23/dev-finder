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

    def view_application_button(application)
        if application.job 
            render "applications/button_view_app", application: application 
        else
            content_tag :p, class: "float-end" do 
                "This job is no longer available."
            end
        end
    end

end