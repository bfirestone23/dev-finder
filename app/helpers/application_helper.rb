module ApplicationHelper

    def created_date(object)
        object.created_at.strftime("%m/%d/%Y")
    end

    def welcome_text
        if !current_user
            render "no_user_welcome"
        elsif current_user.employer
            render "employer_welcome"
        else
            render "applicant_welcome"
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

    def user_detail
        if current_user
            render "user_details"
        end
    end
end
