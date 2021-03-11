class Users::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find_by(id: params[:id])

        if @user.employer 
            @jobs = Job.where(user_id: @user.id)
            render 'devise/users/show_employer'
        else
            if @user == current_user
                @applications = current_user.applications
                render 'devise/users/show_applicant'
            else
                redirect_to root_path, notice: "You do not have access to that page."
            end
        end
    end

    def index
        @users = User.where(employer: true)
        render 'devise/users/index'
    end
end