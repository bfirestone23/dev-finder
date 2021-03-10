class Users::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        if current_user.employer 
            @jobs = Job.where(user_id: current_user.id)
            render 'devise/users/show_employer'
        else
            @applications = current_user.applications
            render 'devise/users/show_applicant'
        end
    end
end