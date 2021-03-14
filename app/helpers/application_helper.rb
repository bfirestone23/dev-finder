module ApplicationHelper

    def created_date(object)
        object.created_at.strftime("%m/%d/%Y")
    end

    def welcome_text
        if !current_user
            content_tag :p, class: "lead" do
                "Sign up or log in above to enter."
            end
        elsif current_user.employer
            render "employer_welcome"
        else
            content_tag :p, class: "lead" do
                "Click a link above to view jobs by company or by location."
            end
        end
    end

    def nav_links
        if !current_user
            render "logged_out_nav"
        else
            render "logged_in_nav"
        end
    end

    def flash_errors
        if flash[:notice]
            render "flash"
        end
    end
    
end
