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
end
